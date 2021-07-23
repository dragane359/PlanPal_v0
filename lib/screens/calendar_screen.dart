import 'dart:html';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

// class LoadDataFromFireBase extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'PlanPal',
//       home: LoadDataFromFireStore(user: ,),
//     );
//   }
// }

class LoadDataFromFireStore extends StatefulWidget {
  const LoadDataFromFireStore({Key? key, required user, group})
      : _user = user,
        _group = group,
        super(key: key);
  final _user;
  final _group;

  @override
  _LoadDataFromFireStoreState createState() => _LoadDataFromFireStoreState();
}

class _LoadDataFromFireStoreState extends State<LoadDataFromFireStore> {
  List<Color> _colorCollection = <Color>[];
  MeetingDataSource? events;
  final List<String> options = <String>['Add'];
  final databaseReference = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController descController = new TextEditingController();
  final TextEditingController fromController = new TextEditingController();
  final TextEditingController toController = new TextEditingController();
  var _user;
  var _group;
  @override
  void initState() {
    _user = widget._user;
    _group = widget._group;
    _initializeEventColor();
    getDataFromFireStore().then((results) {
      SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
        setState(() {});
      });
    });
    super.initState();
  }

  String _errorMessage = '';
  void onChange() {
    setState(() {
      _errorMessage = '';
    });
  }

  Future<void> getDataFromFireStore() async {
    var snapShotsValue = await databaseReference
        .collection("groups")
        .doc(_group.toString())
        .collection('calendar')
        .get();

    final Random random = new Random();
    List<Meeting> list = snapShotsValue.docs
        .map((e) => Meeting(
            eventName: e.data()!['Subject'],
            from:
                DateFormat('dd/MM/yyyy HH:mm:ss').parse(e.data()!['StartTime']),
            to: DateFormat('dd/MM/yyyy HH:mm:ss').parse(e.data()!['EndTime']),
            background: _colorCollection[random.nextInt(9)],
            isAllDay: false))
        .toList();
    setState(() {
      events = MeetingDataSource(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    descController.addListener(onChange);
    fromController.addListener(onChange);
    toController.addListener(onChange);

    return Scaffold(
        appBar: AppBar(
            leading: PopupMenuButton<String>(
          icon: Icon(Icons.menu),
          itemBuilder: (BuildContext context) => options.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList(),
          onSelected: (String value) {
            if (value == 'Add') {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Positioned(
                            right: -40.0,
                            top: -40.0,
                            child: InkResponse(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: CircleAvatar(
                                child: Icon(Icons.close),
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('Add Event'),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    autofocus: false,
                                    controller: descController,
                                    decoration: InputDecoration(
                                      hintText: 'Event Description',
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 10.0, 20.0, 10.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0)),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    onEditingComplete: () => node.nextFocus(),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    autofocus: false,
                                    controller: fromController,
                                    decoration: InputDecoration(
                                      hintText:
                                          'Event Begin Date (dd/mm/yyyy hh:mm:ss)',
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 10.0, 20.0, 10.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0)),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    onEditingComplete: () => node.nextFocus(),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    autofocus: false,
                                    controller: toController,
                                    decoration: InputDecoration(
                                      hintText:
                                          'Event End Date (dd/mm/yyyy hh:mm:ss)',
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 10.0, 20.0, 10.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0)),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    onEditingComplete: () => node.nextFocus(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    child: Text("Submit Event"),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        databaseReference
                                            .collection("groups")
                                            .doc(_group.toString())
                                            .collection('calendar')
                                            .add({
                                          'Subject': descController.text,
                                          'StartTime': fromController.text,
                                          'EndTime': toController.text
                                        });
                                        getDataFromFireStore();
                                        Navigator.pop(context);
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }
            //     else if (value == "Delete") {
            //       try {
            //             databaseReference
            //           .collection("groups")
            // .doc(_group.toString())
            // .collection('calendar')
            //             .delete();
            //       } catch (e) {}
            // }
            // else if (value == "Update") {
            //   try {
            //     databaseReference
            //         .collection('CalendarAppointmentCollection')
            //         .doc('1')
            //         .update({'Subject': 'Meeting'});
            //   } catch (e) {}
            // }
          },
        )),
        body: SfCalendar(
          allowViewNavigation: true,
          showNavigationArrow: true,
          showDatePickerButton:true,
          view: CalendarView.month,
          initialDisplayDate: DateTime.now(),
          dataSource: events,
          monthViewSettings: MonthViewSettings(
              showAgenda: true,
              navigationDirection: MonthNavigationDirection.horizontal),
        ),
        );
  }

  void _initializeEventColor() {
    _colorCollection.add(const Color(0xFF0F8644));
    _colorCollection.add(const Color(0xFF8B1FA9));
    _colorCollection.add(const Color(0xFFD20100));
    _colorCollection.add(const Color(0xFFFC571D));
    _colorCollection.add(const Color(0xFF36B37B));
    _colorCollection.add(const Color(0xFF01A1EF));
    _colorCollection.add(const Color(0xFF3D4FB5));
    _colorCollection.add(const Color(0xFFE47C73));
    _colorCollection.add(const Color(0xFF636363));
    _colorCollection.add(const Color(0xFF0A8043));
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }
}

class Meeting {
  String? eventName;
  DateTime? from;
  DateTime? to;
  Color? background;
  bool? isAllDay;

  Meeting({this.eventName, this.from, this.to, this.background, this.isAllDay});
}

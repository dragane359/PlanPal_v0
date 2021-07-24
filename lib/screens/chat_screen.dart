import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
//import 'package:registration/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_samples/screens/indiv_group_screen.dart';
import 'package:flutterfire_samples/screens/my_groups.dart';
import 'package:flutterfire_samples/screens/sign_in_screen.dart';
import 'package:flutterfire_samples/utils/authentication.dart';
import 'package:flutterfire_samples/widgets/app_bar_title.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
ScrollController _scrollController = new ScrollController();

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required user, group})
      : _user = user,
        _group = group,
        super(key: key);
  final User _user;
  final _group;
  @override
  _ChatScreenState createState() => new _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late User _user;
  var _group;
  String _errorMessage = '';
  final TextEditingController topicController = new TextEditingController();
  final TextEditingController messageController = new TextEditingController();

  void onChange() {
    setState(() {
      _errorMessage = '';
    });
  }

  @override
  void initState() {
    _user = widget._user;
    _group = widget._group;

    super.initState();
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    topicController.addListener(onChange);
    return Scaffold(
        backgroundColor: CustomColors.purplee,
        body: Align(
            alignment: Alignment.topCenter,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16.0, left: 24.0, right: 24.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Current Chat Topic is:',
                    style: TextStyle(fontSize: 36.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                StreamBuilder<DocumentSnapshot>(
                    stream: _firestore
                        .collection('groups')
                        .doc(_group.toString())
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return Center(
                            child: Text(snapshot.data!['finaltopic'],
                                style: TextStyle(
                                    color: Colors.red, fontSize: 50)));
                      }
                      //this will load first
                      return CircularProgressIndicator();
                    }),
                Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      autofocus: false,
                      controller: topicController,
                      decoration: InputDecoration(
                        hintText: 'Type in a new topic!',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => node.nextFocus(),
                    )),
                Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    child: RaisedButton(
                      color: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        'Change topic!',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _firestore
                            .collection("groups")
                            .doc(_group.toString())
                            .update({'finaltopic': topicController.text});
                        topicController.clear();             
                      },
                    )),
                Container(
                  height: 300,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: _firestore
                          .collection('groups')
                          .doc(_group.toString())
                          .collection('messages')
                          .orderBy('timestamp', descending: true)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              controller: _scrollController,
                              reverse: true,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    onTap: () {},
                                    title: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(snapshot.data!.docs[index]
                                            ['text'])),
                                    trailing: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(snapshot
                                              .data!.docs[index]['email']
                                              .toString()),
                                          Text(snapshot
                                              .data!.docs[index]['timestamp']
                                              .toDate()
                                              .toString()
                                              .substring(0, 16))
                                        ]));
                              });
                        }
                        //this will load first
                        return CircularProgressIndicator();
                      }),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      autofocus: false,
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Type Your Message!',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => node.nextFocus(),
                    )),
                Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    child: RaisedButton(
                      color: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        'Send Message!',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _firestore
                            .collection('groups')
                            .doc(_group.toString())
                            .collection('messages')
                            .add({
                          'email': _user.email,
                          'timestamp': Timestamp.now().toDate(),
                          'text': messageController.text
                        });
                        messageController.clear();
                      },
                    )),
                    Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                child: RaisedButton(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    'Return to Group Page!',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => IndivGroupScreen(user: _user,group: _group,)),
                    );
                  },
                )),
              ],
            )));
  }
}

import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';

//import 'package:registration/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_samples/screens/my_groups.dart';
import 'package:flutterfire_samples/screens/pay_me_screen.dart';
import 'package:flutterfire_samples/screens/pay_screen.dart';
import 'package:flutterfire_samples/screens/sign_in_screen.dart';
import 'package:flutterfire_samples/utils/authentication.dart';
import 'package:flutterfire_samples/widgets/app_bar_title.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_samples/screens/home_screen.dart';
import 'package:flutterfire_samples/screens/alr_paid_screen.dart';
import 'package:flutterfire_samples/screens/alr_paid_me_screen.dart';
final FirebaseFirestore _firestore = FirebaseFirestore.instance;


class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({Key? key, required user})
      : _user = user,
        super(key: key);
  final User _user;
  @override
  _PaymentsScreenState createState() => new _PaymentsScreenState();
}

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class _PaymentsScreenState extends State<PaymentsScreen> {
  late User _user;
  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.purplee,
        body: Center(
            child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 16.0, left: 24.0, right: 24.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Welcome to your payments Page! Your UserID is ${_user.uid}',
                style: TextStyle(fontSize: 36.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                child: RaisedButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    'Payment not made yet!',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
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
                    'I owe someone!',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => PayScreen(user: _user)),
                    );
                  },
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: RaisedButton(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    'Someone Owes Me!',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => PayMeScreen(user: _user)),
                    );
                  },
                )),
                Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                child: RaisedButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    'Payments have already been made!',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
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
                    'I have paid someone!',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => AlrPaidScreen(user: _user)),
                    );
                  },
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: RaisedButton(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    'Someone has paid me!',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => AlrPaidMeScreen(user: _user)),
                    );
                  },
                )),
            StreamBuilder<QuerySnapshot>(
        stream: _firestore
             .collection('payments')
             .doc(_user.uid)
             .collection('friends')
             .snapshots(),
        builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context,index){
                            return ListTile(
                              onTap: () {
          },    
                              title: Center(child: Text(snapshot.data!.docs[index].id.toString())),
                              subtitle: Column(
                                children: <Widget>[
                                Text('I owe: ' + snapshot.data!.docs[index]['I owe'].toString()+' dollars'),
                              Text('They owe me: '+snapshot.data!.docs[index]['They owe me'].toString()+' dollars')])
                              
                            );
                          });
                    }
                    //this will load first
                    return CircularProgressIndicator();
        }),
        Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                child: RaisedButton(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    'Return to HomeScreen',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(user: _user)),
                    );
                  },
                )),
          ],
        )));
  }
}

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
                'Welcome to your payments Page! Click on the options to declare a transaction',
                style: TextStyle(fontSize: 36.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
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
          ],
        )));
  }
}

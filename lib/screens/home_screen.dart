import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';

//import 'package:registration/home_page.dart';

class HomeScreen extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                'Welcome to Your Homepage!',
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
                    'My Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
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
                    'My Groups',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
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
                    'My Payments',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
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
                    'Calendar of Events',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
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
                    'Friendlist',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
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
                    'Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
          ],
        )));
  }
}

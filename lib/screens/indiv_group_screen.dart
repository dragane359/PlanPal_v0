import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';

//import 'package:registration/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_samples/screens/chat_screen.dart';
import 'package:flutterfire_samples/screens/my_groups.dart';
import 'package:flutterfire_samples/screens/sign_in_screen.dart';
import 'package:flutterfire_samples/utils/authentication.dart';
import 'package:flutterfire_samples/widgets/app_bar_title.dart';

class IndivGroupScreen extends StatefulWidget {
  const IndivGroupScreen({Key? key, required user, group})
      : _user = user,
        _group = group,
        super(key: key);
  final User _user;
  final _group;
  @override
  _IndivGroupScreenState createState() => new _IndivGroupScreenState();
}

class _IndivGroupScreenState extends State<IndivGroupScreen> {
  late User _user;
  var _group;
  @override
  void initState() {
    _user = widget._user;
    _group = widget._group;

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
                'Welcome to ${_group}!',
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
                    'Chat',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(user: _user,group: _group),
                ),
              );
                  },
                )),
          ],
        )
        ));
  }
}

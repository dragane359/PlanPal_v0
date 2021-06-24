import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';

//import 'package:registration/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_samples/screens/create_group_screen.dart';
import 'package:flutterfire_samples/screens/indiv_group_screen.dart';
import 'package:flutterfire_samples/screens/sign_in_screen.dart';
import 'package:flutterfire_samples/utils/authentication.dart';
import 'package:flutterfire_samples/widgets/app_bar_title.dart';
import 'package:flutterfire_samples/screens/join_group_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class MyGroups extends StatefulWidget {
  const MyGroups({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;

  @override
  _MyGroupsState createState() => new _MyGroupsState();
}

class _MyGroupsState extends State<MyGroups> {
  late User _user;
  List getgrp() {
    _user = widget._user;
    var getarr = [];
_firestore.collection("users").doc(_user.uid).
    get().then((doc) => {
          if (doc.exists)
            {getarr.addAll(doc.get("mygroups"))}
          else
            {
              // doc.data() will be undefined in this case
              Text("No such document!")
            }
        });
    return getarr;
  }

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
                'Here are your groups!',
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
                    'Create A Group',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => CreateGroup(user: _user)),
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
                    'Join A Groupp',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => JoinGroup(user: _user)),
                    );
                  },
                )),
                 StreamBuilder<DocumentSnapshot>(
        stream: _firestore
             .collection('users')
             .doc(_user.uid)
             .snapshots(),
        builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!['mygroups'].length,
                          itemBuilder: (context,index){
                            return ListTile(
                              onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => IndivGroupScreen(user: _user,group:snapshot.data!['mygroups'][index]),
                  ),
            );
          },
                              title: Text(snapshot.data!['mygroups'][index]),
                            );
                          });
                    }
                    //this will load first
                    return CircularProgressIndicator();
        }),
          ])));
  }
}
  Widget _buildList(DocumentSnapshot snapshot) {

    return ListView.builder(
      itemBuilder: (context, index) {
        final doc = snapshot[index]; 

        return Dismissible(
          key: Key(doc.id),
          background: Container(color: Colors.red),
          onDismissed: (direction) {
          },
          child: ListTile(
            title: Text(doc)
          ),
        );

       
      }
    );

  }
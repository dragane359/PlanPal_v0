import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutter/material.dart';
//import 'package:registration/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_samples/screens/sign_in_screen.dart';
import 'package:flutterfire_samples/utils/authentication.dart';
import 'package:flutterfire_samples/widgets/app_bar_title.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_samples/screens/my_groups.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var y;

class JoinGroup extends StatefulWidget {
  const JoinGroup({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;
  @override
  _JoinGroupState createState() => new _JoinGroupState();
}

class _JoinGroupState extends State<JoinGroup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController joingrpnameController =
      new TextEditingController();
  String _errorMessage = '';

  void onChange() {
    setState(() {
      _errorMessage = '';
    });
  }

  late User _user;
  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    joingrpnameController.addListener(onChange);

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: CustomColors.purplee,
        radius: 90.0,
        child: Image.asset('assets/planpallogo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.name,
      autofocus: false,
      controller: joingrpnameController,
      decoration: InputDecoration(
        hintText: 'GroupName',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      textInputAction: TextInputAction.next,
      onEditingComplete: () => node.nextFocus(),
    );

    final cancel = Padding(
        padding: EdgeInsets.zero,
        child: FlatButton(
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyGroups(user: _user),
              ),
            );
          },
        ));
    final JoinGroupButton = Padding(
        padding: EdgeInsets.zero,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: () async {
              var file =
                  _firestore.collection("groups").doc(joingrpnameController.text);
              var files = await file.get();
              if (!files.exists) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          content: Stack(overflow: Overflow.visible, children: <
                              Widget>[
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
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Group does not exist'),
                        ),
                      ]));
                    });
              } else {
                var docRef = _firestore
                    .collection("groups")
                    .doc(joingrpnameController.text);
                docRef.get().then((doc) => {
                      if (doc.exists)
                        {
                          _firestore
                              .collection("groups")
                              .doc(joingrpnameController.text)
                              .update(({
                                'members': FieldValue.arrayUnion([
                                  _user.uid,
                                ])
                              })),
                          _firestore.collection("users").doc(_user.uid).update({
                            'mygroups': FieldValue.arrayUnion([
                              joingrpnameController.text,
                            ])
                          })
                        }
                      else
                        {
                          // doc.data() will be undefined in this case
                          print("No such document!")
                        }
                    });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyGroups(user: _user),
                  ),
                );
              }
            },
            padding: EdgeInsets.all(12),
            color: Colors.pink,
            child: Text(
              'Join This Group!',
              style: TextStyle(color: Colors.white),
            )));

    // final registerButton = Padding(
    //   padding: EdgeInsets.zero,
    //   child: RaisedButton(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(24),
    //     ),
    //     onPressed: () {
    //       Navigator.of(context).pushReplacement(
    //           MaterialPageRoute(builder: (context) => EmailNextScreen()));
    //     },
    // padding: EdgeInsets.all(12),
    // color: Colors.lightGreen,
    // child: Text('Register', style: TextStyle(color: Colors.white)),
    //   ),
    // );

    return Scaffold(
        backgroundColor: CustomColors.purplee,
        body: Center(
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                logo,
                SizedBox(height: 24.0),
                email,
                SizedBox(height: 8.0),
                JoinGroupButton,
                SizedBox(height: 24.0),
                cancel,
                SizedBox(height: 24.0),
              ],
            ),
          ),
        ));
  }

  // Future<String> signIn(final String email, final String password)  {
  //   Future<UserCredential> x =  _firebaseAuth.signInWithEmailAndPassword(
  //       email: email, password: password).then((credentials) {
  //   String userID = credentials.user.uid;
  // };

}

import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutter/material.dart';
//import 'package:registration/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_samples/screens/sign_in_screen.dart';
import 'package:flutterfire_samples/utils/authentication.dart';
import 'package:flutterfire_samples/widgets/app_bar_title.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_samples/screens/my_groups.dart';
import 'package:flutterfire_samples/screens/payments_screen.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var y;

class AlrPaidMeScreen extends StatefulWidget {
  const AlrPaidMeScreen({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;
  @override
  _AlrPaidMeScreenState createState() => new _AlrPaidMeScreenState();
}

class _AlrPaidMeScreenState extends State<AlrPaidMeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController friendemailController =
      new TextEditingController();
  final TextEditingController amounttopayController =
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

    friendemailController.addListener(onChange);

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: CustomColors.purplee,
        radius: 90.0,
        child: Image.asset('assets/planpallogo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: const TextInputType.numberWithOptions(decimal: false),
      autofocus: false,
      controller: friendemailController,
      decoration: InputDecoration(
        hintText: 'Email Address of Person',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      textInputAction: TextInputAction.next,
      onEditingComplete: () => node.nextFocus(),
    );
// const TextInputType.numberWithOptions(decimal: true);
    final amount = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      controller: amounttopayController,
      decoration: InputDecoration(
        hintText: 'Amount they have paid you',
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
                  builder: (context) => PaymentsScreen(user: _user),
                ),
              );
          },
        ));
    final DeclarePaymentButton = Padding(
        padding: EdgeInsets.zero,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: () {
              // Future<String> selfemail =
              //     _firestore.collection("users").doc(_user.uid).get().then((value) => value.data()!['email'].toString());
              var docRef = _firestore
                  .collection("payments")
                  .doc(_user.email)
                  .collection('friends')
                  .doc(friendemailController.text);
              docRef.get().then((doc) => {
                    if (doc.exists)
                      {
                        print(int.parse(amounttopayController.text)),
                        _firestore
                          .collection("payments")
                          .doc(_user.email)
                          .collection('friends')
                          .doc(friendemailController.text)
                            .update(({
                              'They owe me': FieldValue.increment(-num.parse(amounttopayController.text)) 
                            })),
                        _firestore
                          .collection("payments")
                          .doc(friendemailController.text)
                          .collection('friends')
                          .doc(_user.email)
                            .update(({
                              'I owe': FieldValue.increment(num.parse(amounttopayController.text)) 
                            })),
                      }
                    else
                      {
                        print(_user.uid),
                        _firestore
                          .collection("payments")
                          .doc(_user.email)
                          .collection('friends')
                          .doc(friendemailController.text)
                            .set(({
                              'I owe': 0
                            ,
                              'They owe me': -num.parse(amounttopayController.text)
                            })),
                        print('here'),
                        _firestore
                          .collection("payments")
                          .doc(friendemailController.text)
                          .collection('friends')
                          .doc(_user.email)
                            .set(({
                              'I owe': -num.parse(amounttopayController.text)
                            ,
                              'They owe me': 0
                            })),
                      }
                  });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentsScreen(user: _user),
                ),
              );
            },
            padding: EdgeInsets.all(12),
            color: Colors.pink,
            child: Text(
              'Declare this payment!',
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
                amount,
                SizedBox(height: 24.0),
                DeclarePaymentButton,
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:registration/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_samples/screens/email_next_screen.dart';
//import 'package:registration/home_page.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutter/material.dart';
// ignore: duplicate_import
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_samples/screens/user_info_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/user_info_screen.dart';
import 'package:flutterfire_samples/screens/email_next_screen.dart';

class ExistingEmailLogin extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _ExistingEmailLoginState createState() => new _ExistingEmailLoginState();
}

class _ExistingEmailLoginState extends State<ExistingEmailLogin> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  String _errorMessage = '';

  void onChange() {
    setState(() {
      _errorMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    emailController.addListener(onChange);
    passwordController.addListener(onChange);

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: CustomColors.purplee,
        radius: 90.0,
        child: Image.asset('assets/planpallogo.png'),
      ),
    );

    final errorMessage = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '$_errorMessage',
        style: TextStyle(fontSize: 14.0, color: Colors.red),
        textAlign: TextAlign.center,
      ),
    );

    final email = TextFormField(
      validator: (value) {
        if (value!.isEmpty || !value.contains('@')) {
          return 'Please enter a valid email.';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      textInputAction: TextInputAction.next,
      onEditingComplete: () => node.nextFocus(),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(node);
      },
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final forgotLabel = FlatButton(
      padding: const EdgeInsets.all(10),
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
    final cancel = Padding(
        padding: EdgeInsets.zero,
        child: FlatButton(
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
    final loginButton = Padding(
        padding: EdgeInsets.zero,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text)
                    .then((uid) => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => EmailNextScreen())))
                    .catchError((error) => {processError(error)});
              }
            },
            padding: EdgeInsets.all(12),
            color: Colors.red,
            child: Text(
              'Log in!',
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
                errorMessage,
                SizedBox(height: 12.0),
                email,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 24.0),
                forgotLabel,
                SizedBox(height: 24.0),
                loginButton,
                SizedBox(height: 24.0),
                cancel
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

  void processError(final PlatformException error) {
    if (error.code == "ERROR_USER_NOT_FOUND") {
      setState(() {
        _errorMessage = "Unable to find user. Please register.";
      });
    } else if (error.code == "ERROR_WRONG_PASSWORD") {
      setState(() {
        _errorMessage = "Incorrect password.";
      });
    } else {
      setState(() {
        _errorMessage =
            "There was an error logging in. Please try again later.";
      });
    }
  }
}

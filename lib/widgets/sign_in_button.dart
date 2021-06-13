import 'package:flutter/material.dart';
import 'package:flutterfire_samples/screens/existing_email_login.dart';
//import 'package:flutterfire_samples/widgets/create_account_button.dart';


class SigninButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Center(
        child: ElevatedButton(
          child: Text('Sign in to your account!'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExistingEmailLogin()),
            );
          },
        ),
      ),
    );
  }
}
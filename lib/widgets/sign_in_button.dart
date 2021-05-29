import 'package:flutter/material.dart';
//import 'package:flutterfire_samples/widgets/create_account_button.dart';
import 'package:flutterfire_samples/screens/register_screen.dart';


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
              MaterialPageRoute(builder: (context) => RegisterScreen()),
            );
          },
        ),
      ),
    );
  }
}
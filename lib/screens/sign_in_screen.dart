import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/utils/authentication.dart';
import 'package:flutterfire_samples/widgets/create_account_button.dart';
import 'package:flutterfire_samples/widgets/google_sign_in_button.dart';
import 'package:flutterfire_samples/widgets/sign_in_button.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.purplee,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/planpallogo.png',
                        height: 160,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'PlanPal',
                      style: TextStyle(
                        color: CustomColors.teal,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      'Meetups made easy!',
                      style: TextStyle(
                        color: CustomColors.lightpink,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              CreateAccountButton(),
              SigninButton(),
              // FutureBuilder(
              //   future: Authentication.initializeFirebase(context: context),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasError) {
              //       return Text('Error initializing Firebase');
              //     } else if (snapshot.connectionState == ConnectionState.done) {
              //       return GoogleSignInButton();
              //     }
              //     return CircularProgressIndicator(
              //       valueColor: AlwaysStoppedAnimation<Color>(
              //         CustomColors.firebaseOrange,
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

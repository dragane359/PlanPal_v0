import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/sign_in_screen.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlanPal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        brightness: Brightness.dark,
      ),
      home: SignInScreen(),
    );
  }
}

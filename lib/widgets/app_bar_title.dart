import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/planpallogo.png',
          height: 50,
        ),
        SizedBox(width: 50),
      ],
    );
  }
}

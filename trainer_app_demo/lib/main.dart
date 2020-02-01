import 'package:flutter/material.dart';

import 'src/welcomepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team BR',
      home: WelcomePage(),
    );
  }
}




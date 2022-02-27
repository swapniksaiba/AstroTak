import 'package:astrotak/screens/add_profile_screen.dart';
import 'package:astrotak/screens/ask_question_screen.dart';
import 'package:astrotak/screens/friends_and_family_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AstroTak',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: AskQuestionScreen(),
    );
  }
}

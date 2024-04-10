import 'package:flutter/material.dart';
import 'package:flutterexamapp/HomeScreen/FristScreen.dart';

import 'AddScreen/AddScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        '/':(context) =>FirstScreen(),
        '/AddScreen':(context) =>AddScreen(),
      },
    );
  }
}

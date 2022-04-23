import 'package:flutter/material.dart';
import 'package:flutter_like_in_video/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "My App",
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';

import 'login/login_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final yellow = const Color(0xfffdd000);
  final white = const Color(0xfff2efe2);
  final darkGrey = const Color(0xff5d6d7c);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          scaffoldBackgroundColor: yellow,
          textTheme: Theme.of(context).textTheme.copyWith(
              headline2: TextStyle(color: white, fontWeight: FontWeight.bold, letterSpacing: 5),
              headline5: TextStyle(color: Colors.white))),
      title: 'Material App',
      home: LoginView(),
    );
  }
}

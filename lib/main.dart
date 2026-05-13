import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Sneaker Store',

      initialRoute: '/',

      routes: {

        '/': (context) => const LoginPage(),

        '/register': (context) =>
            const RegisterPage(),

        '/home': (context) =>
            const MainPage(),
      },
    );
  }
}
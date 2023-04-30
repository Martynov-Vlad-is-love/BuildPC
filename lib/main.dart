import 'package:buildpc/ui/pages/login_page/login_screen.dart';
import 'package:buildpc/ui/pages/main_page/main_page.dart';
import 'package:buildpc/ui/pages/registration_page/registration_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/main': (context) => const MainPage(),
        '/login': (context) => const LoginScreen(),
        '/registration': (context) => const RegistrationScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

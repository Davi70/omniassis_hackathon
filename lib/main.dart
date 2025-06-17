import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/operador_screen.dart';
import 'screens/user_home_screen.dart';
import 'screens/concesion_screen.dart' hide RegisterScreen;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transporte Seguro',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Color(0xFF111827),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/operador': (context) => OperadorScreen(),
        '/user_home': (context) => UserHomeScreen(),
        '/concesion': (context) => ConcesionScreen(),
      },
    );
  }
}

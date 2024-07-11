import 'package:flutter/material.dart';
import 'package:login_register_example/login.dart';
import 'package:login_register_example/register.dart';
import 'package:login_register_example/home.dart';
import 'package:login_register_example/guitar.dart';
import 'package:login_register_example/drum.dart';
import 'package:login_register_example/bass.dart';
import 'package:login_register_example/efek.dart';
import 'package:login_register_example/keranjang.dart'; // Tambahkan ini

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login/Register Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/guitar': (context) => GuitarPage(),
        '/drum': (context) => DrumPage(),
        '/bass': (context) => BassPage(),
        '/efek': (context) => EfekPage(),
        '/keranjang': (context) => KeranjangPage(), // Tambahkan ini
      },
    );
  }
}

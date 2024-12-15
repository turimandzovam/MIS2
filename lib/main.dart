import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/random_joke_screen.dart';

void main() {
  runApp(const JokesApp());
}

class JokesApp extends StatelessWidget {
  const JokesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App 211193',
      theme: ThemeData(
        primarySwatch: Colors.green ,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/randomJoke': (context) => const RandomJokeScreen(),
      },
    );
  }
}

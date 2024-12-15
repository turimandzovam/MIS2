import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_services.dart';

class RandomJokeScreen extends StatefulWidget {
  const RandomJokeScreen({super.key});

  @override
  _RandomJokeScreenState createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  final ApiService apiService = ApiService();
  late Future<Joke> randomJoke;

  @override
  void initState() {
    super.initState();
    randomJoke = apiService.getRandomJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Joke'),
      ),
      body: FutureBuilder<Joke>(
        future: randomJoke,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No joke found.'));
          }
          final joke = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(joke.setup, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Text(joke.punchline, style: TextStyle(fontSize: 20, color: Colors.grey[700])),
              ],
            ),
          );
        },
      ),
    );
  }
}

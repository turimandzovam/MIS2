import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_services.dart';

class JokeListScreen extends StatefulWidget {
  final String type;

  const JokeListScreen({super.key, required this.type});

  @override
  _JokeListScreenState createState() => _JokeListScreenState();
}

class _JokeListScreenState extends State<JokeListScreen> {
  final ApiService apiService = ApiService();
  List<Joke> jokes = [];

  @override
  void initState() {
    super.initState();
    _loadJokes();
  }

  Future<void> _loadJokes() async {
    try {
      jokes = await apiService.getJokesByType(widget.type);
      setState(() {});
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.type} Jokes'),
      ),
      body: jokes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(jokes[index].setup),
            subtitle: Text(jokes[index].punchline),
          );
        },
      ),
    );
  }
}

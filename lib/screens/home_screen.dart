import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../widgets/joke_card.dart';
import 'joke_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();
  List<String> jokeTypes = [];

  @override
  void initState() {
    super.initState();
    _loadJokeTypes();
  }

  Future<void> _loadJokeTypes() async {
    try {
      jokeTypes = await apiService.getJokeTypes();
      setState(() {});
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes App 211193'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shuffle),
            onPressed: () {
              Navigator.pushNamed(context, '/randomJoke');
            },
          ),
        ],
      ),
      body: jokeTypes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: jokeTypes.length,
        itemBuilder: (context, index) {
          return JokeCard(
            type: jokeTypes[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JokeListScreen(type: jokeTypes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

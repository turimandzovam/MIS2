import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String type;
  final VoidCallback onTap;

  const JokeCard({super.key, required this.type, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(type, style: const TextStyle(fontSize: 18)),
        onTap: onTap,
      ),
    );
  }
}

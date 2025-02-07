import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome, Bagus Subagja!'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            100,
            (index) => ListTile(
              leading: Text(
                (index + 1).toString(),
              ),
              title: Text('Ini item ke ${index + 1}'),
            ),
          ),
        ),
      )),
    );
  }
}

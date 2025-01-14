import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
        leading: Icon(Icons.menu),
        centerTitle: true,
        actions: [
          Icon(Icons.search_rounded),
          SizedBox(width: 20),
          Icon(Icons.notifications),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(padding: EdgeInsets.all(8),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

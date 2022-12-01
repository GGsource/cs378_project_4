import 'package:cs378_project_4/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.amber.shade200, Colors.amber.shade800],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                title: const Text("Project 4"),
                centerTitle: true,
                pinned: true,
                backgroundColor: Colors.amber.shade200,
                expandedHeight: 150,
              ),
              SliverAppBar(
                title: const Text("Flutter Charts Package"),
                backgroundColor: Colors.amber.shade300,
              ),
              const SliverToBoxAdapter(child: ChartPage()),
            ],
          ),
        ],
      )),
    );
  }
}

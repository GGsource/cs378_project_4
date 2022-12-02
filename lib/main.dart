import 'package:cs378_project_4/bee_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: Colors.amber.shade700,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.hexagon_rounded),
                ),
                Tab(
                  icon: Icon(Icons.female_rounded),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Screen 1
              const BeeChart(),
              // Screen 2
              Container(
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}

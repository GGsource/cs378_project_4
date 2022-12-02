import 'package:cs378_project_4/audio_page.dart';
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
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.amber.shade700, Colors.green])),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon:
                      Icon(Icons.hexagon_rounded, color: Colors.amber.shade900),
                ),
                Tab(
                  icon: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.green.shade900,
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              // Screen 1
              BeeChart(),
              // Screen 2
              MusicPage(),
            ],
          ),
        ),
      ),
    );
  }
}

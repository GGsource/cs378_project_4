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
    const MaterialColor firstColor = Colors.amber;
    const MaterialColor secondColor = Colors.green;
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [firstColor, secondColor])),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.hexagon_rounded,
                    color: firstColor.shade900,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.audiotrack_rounded,
                    color: secondColor.shade900,
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              // Screen 1
              BeeChart(swatch: firstColor),
              // Screen 2
              AudioPage(swatch: secondColor),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

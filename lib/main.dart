import 'package:cs378_project_4/audio_page.dart';
import 'package:cs378_project_4/bee_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//////////////////////////////////////////////////
// Project 4: Package Exploration
// Geovani Gonzalez
// UIN: 657437605
// Completed on: 12/02/2022
//////////////////////////////////////////////////
// Description:
// For this project I chose to explore the
// charts_flutter package and the audioplayers
// package.
//
// Charts_Flutter:
//This is a package that allows
// for the ability to graph data in a variety
// of forms, including what I used in the
// first screen of this application, bar charts.
// I used this package to make a chart displaying
// fictitious data of what the Bee population
// would be if I had been elected as World
// Dictator in 2012  at 10 years old.
//
// AudioPlayers:
// The latter is a package allowing for the playback
// of audio files. I've used this to create a list
// of music-player styled cards that display an
// album cover, title, artists, and a button to
// play and pause the audio. Additionally, a fully
// functional seeker-slider is implemented, allowing
// the user to drag and start the song at a particular
// point. Duration and time elapsed are also shown.
//
//////////////////////////////////////////////////

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
                    icon: Icon(Icons.hexagon_rounded,
                        color: firstColor.shade900)),
                Tab(
                    icon: Icon(Icons.audiotrack_rounded,
                        color: secondColor.shade900)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              BeeChart(swatch: firstColor),
              AudioPage(swatch: secondColor),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

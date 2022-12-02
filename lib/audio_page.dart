import 'package:audioplayers/audioplayers.dart';
import 'package:cs378_project_4/player_panel.dart';
import 'package:flutter/material.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.green],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          // Title Bar
          Container(
            height: 50,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green.shade900,
                    Colors.green.shade700,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(60))),
            child: Center(
              child: Text(
                "Package: AudioPlayers",
                textScaleFactor: 2,
                style: TextStyle(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.green.shade900,
                      offset: const Offset(2, 2),
                      blurRadius: 2,
                    ),
                    Shadow(
                      color: Colors.green.shade900,
                      offset: const Offset(-2, -2),
                      blurRadius: 2,
                    ),
                    Shadow(
                      color: Colors.green.shade900,
                      offset: const Offset(-2, 2),
                      blurRadius: 2,
                    ),
                    Shadow(
                      color: Colors.green.shade900,
                      offset: const Offset(2, -2),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Body of screen
          const PlayerPanel(
              audioPath: "audio/Stal.mp3",
              imagePath: "assets/images/Stal.jpg",
              title: "Stal",
              artist: "C418",
              swatch: Colors.amber),
        ],
      ),
    );
  }
}

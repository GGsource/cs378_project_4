import 'package:audioplayers/audioplayers.dart';
import 'package:cs378_project_4/player_panel.dart';
import 'package:flutter/material.dart';

class AudioPage extends StatefulWidget {
  final MaterialColor swatch;
  const AudioPage({super.key, required this.swatch});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, widget.swatch.shade900],
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
                      widget.swatch.shade900,
                      widget.swatch.shade700,
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
                        color: widget.swatch.shade900,
                        offset: const Offset(2, 2),
                        blurRadius: 2,
                      ),
                      Shadow(
                        color: widget.swatch.shade900,
                        offset: const Offset(-2, -2),
                        blurRadius: 2,
                      ),
                      Shadow(
                        color: widget.swatch.shade900,
                        offset: const Offset(-2, 2),
                        blurRadius: 2,
                      ),
                      Shadow(
                        color: widget.swatch.shade900,
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
              swatch: Colors.red,
            ),
            const PlayerPanel(
              audioPath: "audio/ye.m4a",
              imagePath: "assets/images/ball.png",
              title: "NFL Theme",
              artist: "The NFL",
              swatch: Colors.orange,
            ),
            const PlayerPanel(
              audioPath: "audio/theme.mp3",
              imagePath: "assets/images/uncanny.png",
              title: "Sneaky Adventure",
              artist: "Kevin Macleod",
              swatch: Colors.yellow,
            ),
            const PlayerPanel(
              audioPath: "audio/diddy.flac",
              imagePath: "assets/images/tribute.jpg",
              title: "I'll Be Missing You",
              artist: "Diddy, Faith Evans",
              swatch: Colors.green,
            ),
            const PlayerPanel(
              audioPath: "audio/ghost_whisper.mp3",
              imagePath: "assets/images/spooky.jpg",
              title: "Alleged Ghost Audio",
              artist: "Unknown",
              swatch: Colors.blue,
            ),
            const PlayerPanel(
              audioPath: "audio/Apple.mp3",
              imagePath: "assets/images/eden.jpg",
              title: "Apple",
              artist: "The Narcissist Cookbook",
              swatch: Colors.purple,
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: widget.swatch.shade600,
                  gradient: LinearGradient(
                    colors: [
                      widget.swatch.shade700,
                      widget.swatch.shade900,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(60))),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "AudioPlayers as expected allows for the playback of audio files. For demonstration purposes I have turned this into several song players with pausing and track seeking capabilities, which update their progress in real time and display the song duration.",
                  style: TextStyle(height: 2.3, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

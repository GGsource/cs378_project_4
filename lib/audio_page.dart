import 'package:audioplayers/audioplayers.dart';
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
          audioCard(
              path: "Stal.mp3",
              title: "Stal",
              artist: "C418",
              swatch: Colors.amber),
          ElevatedButton(
              onPressed: () {
                final audioPlayer = AudioPlayer();
                audioPlayer.play(AssetSource("ye.m4a"));
              },
              child: Text("Test Audio"))
        ],
      ),
    );
  }

  Widget audioCard({
    required String path,
    required String title,
    required String artist,
    required MaterialColor swatch,
  }) {
    final AudioPlayer audio = AudioPlayer();
    bool isPlaying = false;
    Icon play = const Icon(Icons.play_arrow_rounded);
    Icon pause = const Icon(Icons.pause_rounded);
    Icon currentIcon = play;
    Duration duration = Duration.zero;
    Duration position = Duration.zero;

    audio.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
        if (isPlaying) {
          currentIcon = pause;
        } else {
          currentIcon = play;
        }
      });
    });
    audio.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audio.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [swatch.shade300, swatch.shade700]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                spacing: 70,
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Stal.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // color: swatch.shade900,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Column(
                      children: [
                        Text(
                          title,
                          textScaleFactor: 2,
                          style: TextStyle(color: swatch.shade900),
                        ),
                        Text(
                          "by $artist",
                          style: TextStyle(color: swatch.shade900),
                        ),
                        IconButton(
                          onPressed: () async {
                            if (isPlaying) {
                              await audio.pause();
                            } else {
                              await audio.play(AssetSource(path));
                            }
                          },
                          icon: currentIcon,
                          iconSize: 50,
                          color: swatch.shade900,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (val) async {},
                thumbColor: swatch.shade900,
                activeColor: swatch,
                inactiveColor: swatch.shade200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(position.inMinutes.toString()),
                  Text(duration.inMinutes.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

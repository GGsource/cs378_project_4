import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayerPanel extends StatefulWidget {
  final String audioPath;
  final String imagePath;
  final String title;
  final String artist;
  final MaterialColor swatch;
  const PlayerPanel({
    super.key,
    required this.audioPath,
    required this.imagePath,
    required this.title,
    required this.artist,
    required this.swatch,
  });

  @override
  State<PlayerPanel> createState() => _PlayerPanelState();
}

class _PlayerPanelState extends State<PlayerPanel> {
  final AudioPlayer audio = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    audio.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
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
  }

  Future setAudio() async {
    audio.setSourceAsset(widget.audioPath);
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    audio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [widget.swatch.shade300, widget.swatch.shade700]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.imagePath),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // color: swatch.shade900,
                  ),
                  SizedBox(
                    width: 260,
                    child: Column(
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              color: widget.swatch.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "by ${widget.artist}",
                          style: TextStyle(color: widget.swatch.shade900),
                        ),
                        IconButton(
                          onPressed: () async {
                            if (isPlaying) {
                              await audio.pause();
                            } else {
                              await audio.resume();
                              // await audio.play(AssetSource(path));
                            }
                          },
                          icon: isPlaying
                              ? const Icon(Icons.pause_rounded)
                              : const Icon(Icons.play_arrow_rounded),
                          iconSize: 40,
                          color: widget.swatch.shade900,
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
                onChanged: (val) async {
                  final position = Duration(seconds: val.toInt());
                  await audio.seek(position);
                },
                thumbColor: widget.swatch.shade900,
                activeColor: widget.swatch,
                inactiveColor: widget.swatch.shade200,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      timeFormat(position),
                      style: TextStyle(color: widget.swatch.shade900),
                    ),
                    Text(
                      timeFormat(duration),
                      style: TextStyle(color: widget.swatch.shade900),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String timeFormat(Duration dur) {
  String addZeroes(int n) => n.toString().padLeft(2, '0');
  return "${addZeroes(dur.inMinutes.remainder(60))}:${addZeroes(dur.inSeconds.remainder(60))}";
}

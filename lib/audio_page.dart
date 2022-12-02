import 'package:flutter/material.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
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
        ],

        // Body of screen
      ),
    );
  }
}

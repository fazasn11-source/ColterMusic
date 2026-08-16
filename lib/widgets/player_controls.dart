import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/player_service.dart';

class PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerService>(
      builder: (context, playerService, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.skip_previous),
              color: Colors.white,
              iconSize: 32,
              onPressed: playerService.previousSong,
            ),
            SizedBox(width: 16),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF1DB954),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  playerService.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 28,
                ),
                iconSize: 40,
                onPressed: playerService.togglePlayPause,
              ),
            ),
            SizedBox(width: 16),
            IconButton(
              icon: Icon(Icons.skip_next),
              color: Colors.white,
              iconSize: 32,
              onPressed: playerService.nextSong,
            ),
          ],
        );
      },
    );
  }
}

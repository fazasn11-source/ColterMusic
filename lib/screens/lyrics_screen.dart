import 'package:flutter/material.dart';
import '../models/song.dart';

class LyricsScreen extends StatelessWidget {
  final Song song;

  const LyricsScreen({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1DB954)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Lyrics'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              song.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              song.artist,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              song.lyrics,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                height: 1.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

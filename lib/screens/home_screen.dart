import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/music_service.dart';
import '../services/player_service.dart';
import '../widgets/song_tile.dart';
import 'search_screen.dart';
import 'player_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ColterMusic',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1DB954),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF1DB954)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<MusicService>(
        builder: (context, musicService, _) {
          if (musicService.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF1DB954),
              ),
            );
          }

          if (musicService.songs.isEmpty) {
            return const Center(
              child: Text('No songs found'),
            );
          }

          return ListView.builder(
            itemCount: musicService.songs.length,
            itemBuilder: (context, index) {
              final song = musicService.songs[index];
              return SongTile(
                song: song,
                onTap: () {
                  context.read<PlayerService>().playSong(song);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PlayerScreen(),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

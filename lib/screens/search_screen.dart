import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/music_service.dart';
import '../services/player_service.dart';
import '../widgets/song_tile.dart';
import 'player_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Search songs or artists...',
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none,
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: Color(0xFF1DB954)),
                    onPressed: () {
                      _controller.clear();
                      context.read<MusicService>().search('');
                    },
                  )
                : null,
          ),
          style: const TextStyle(color: Colors.white),
          onChanged: (value) {
            context.read<MusicService>().search(value);
            setState(() {});
          },
        ),
      ),
      body: Consumer<MusicService>(
        builder: (context, musicService, _) {
          if (musicService.searchResults.isEmpty) {
            return const Center(
              child: Text('No results found'),
            );
          }

          return ListView.builder(
            itemCount: musicService.searchResults.length,
            itemBuilder: (context, index) {
              final song = musicService.searchResults[index];
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/music_service.dart';
import 'services/player_service.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ColterMusic());
}

class ColterMusic extends StatelessWidget {
  const ColterMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MusicService()),
        ChangeNotifierProvider(create: (_) => PlayerService()),
      ],
      child: MaterialApp(
        title: 'ColterMusic',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          primaryColor: const Color(0xFF1DB954),
          scaffoldBackgroundColor: const Color(0xFF121212),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF121212),
            elevation: 0,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

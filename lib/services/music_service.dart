import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/song.dart';

class MusicService extends ChangeNotifier {
  List<Song> _songs = [];
  List<Song> _searchResults = [];
  bool _isLoading = true;

  List<Song> get songs => _songs;
  List<Song> get searchResults => _searchResults;
  bool get isLoading => _isLoading;

  MusicService() {
    loadSongs();
  }

  Future<void> loadSongs() async {
    try {
      _isLoading = true;
      notifyListeners();

      final String jsonString =
          await rootBundle.loadString('assets/songs.json');
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
      final List<dynamic> songsJson = jsonData['songs'] ?? [];

      _songs = songsJson.map((json) => Song.fromJson(json)).toList();
      _searchResults = _songs;

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error loading songs: $e');
      _isLoading = false;
      notifyListeners();
    }
  }

  void search(String query) {
    if (query.isEmpty) {
      _searchResults = _songs;
    } else {
      _searchResults = _songs
          .where((song) =>
              song.title.toLowerCase().contains(query.toLowerCase()) ||
              song.artist.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Song? getSongById(String id) {
    try {
      return _songs.firstWhere((song) => song.id == id);
    } catch (e) {
      return null;
    }
  }
}

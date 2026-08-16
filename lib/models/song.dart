class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String imageUrl;
  final String audioUrl;
  final String lyrics;
  final Duration duration;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.imageUrl,
    required this.audioUrl,
    required this.lyrics,
    required this.duration,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'] ?? '',
      title: json['title'] ?? 'Unknown',
      artist: json['artist'] ?? 'Unknown Artist',
      album: json['album'] ?? 'Unknown Album',
      imageUrl: json['imageUrl'] ?? '',
      audioUrl: json['audioUrl'] ?? '',
      lyrics: json['lyrics'] ?? 'No lyrics available',
      duration: Duration(
        seconds: json['duration'] ?? 0,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'album': album,
      'imageUrl': imageUrl,
      'audioUrl': audioUrl,
      'lyrics': lyrics,
      'duration': duration.inSeconds,
    };
  }
}

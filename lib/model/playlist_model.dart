import 'package:music_app_ui/model/songs_model.dart';

class PlayList{
  final String title;
  final String imageUrl;
  final List<Song> songs;
  PlayList({
    required this.title,
    required this.songs,
    required this.imageUrl,
});
  
  static List<PlayList> playlist = [
    PlayList(title: "Hip-Hop R&B Mix",
        songs: Song.songs,
        imageUrl: "https://images.unsplash.com/photo-1622493339458-ef341561828a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGxheWxpc3QlMjBpbWFnZXN8ZW58MHx8MHx8fDA%3D"),

  PlayList(title: "Rock & Roll",
  songs: Song.songs,
  imageUrl: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBsYXlsaXN0JTIwaW1hZ2VzfGVufDB8fDB8fHww"),

  PlayList(title: "Techno",
  songs: Song.songs,
  imageUrl: "https://images.unsplash.com/photo-1616356607338-fd87169ecf1a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGxheWxpc3R8ZW58MHx8MHx8fDA%3D")

  ];
}
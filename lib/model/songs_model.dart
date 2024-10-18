class Song{
      final String title;
      final String description;
      final String url;
      final String coverUrl;
      const Song({required this.title,required this.description,required this.url,required this.coverUrl});

      static List<Song> songs = [
      const Song(title: "Glass ",
      description: "Glass",
      url: "assets/music/glass.mp3",
      coverUrl: "assets/images/glass.jpg"),

        const Song(title: "Illusiona ",
            description: "Illusiona",
            url: "assets/music/illusions.mp3",
            coverUrl: "assets/images/illusions.jpg"),

        const Song(title: "Pray",
              description: "Pray",
            url: "assets/music/pray.mp3",
            coverUrl: "assets/images/pray.jpg")
      ];
}

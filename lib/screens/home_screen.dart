import 'package:flutter/material.dart';
import 'package:music_app_ui/model/playlist_model.dart';
import '../model/songs_model.dart';
import '../widget/playlist_card.dart';
import '../widget/section_header.dart';
import '../widget/song_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Song> song = Song.songs;
  List<PlayList> playList = PlayList.playlist;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8)
          ]
        )
      ),
      child:  Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        bottomNavigationBar: const CustomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const DiscoverMusic(),
              TrendingMusic(song: song),
              _PlaylistMusic(playList: playList),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlaylistMusic extends StatelessWidget {
  const _PlaylistMusic({
    super.key,
    required this.playList,
  });

  final List<PlayList> playList;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(20.0),
    child:Column(
      children: [
        const SectionHeader(title: "Playlists"),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 20),
          itemCount: playList.length,
            itemBuilder: (context,index){
                return PlayListCard(playList: playList[index]);
        })
      ],
    ),);
  }
}



class TrendingMusic extends StatelessWidget {
  const TrendingMusic({
    super.key,
    required this.song,
  });

  final List<Song> song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0,left: 20,bottom: 20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SectionHeader(title:"Trending Music"),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: MediaQuery.of(context).size.height *0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: song.length,
                itemBuilder: (context,index){
              return SongsCard(song: song[index]);
            })
          )
        ],
      ),
    );
  }
}

class DiscoverMusic extends StatelessWidget {
  const DiscoverMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome",style: Theme.of(context).textTheme.bodyLarge,),
          const SizedBox(height: 5,),
          Text("Enjoy your favourite music",
            style: Theme.of(context).textTheme
                .titleLarge?.copyWith(
                fontWeight: FontWeight.bold),),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              hintText: "Search",
              filled: true,
              fillColor: Colors.white,
              hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey.shade400),
              prefixIcon: Icon(Icons.search,color: Colors.grey.shade400,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none
              )
            ),
          )
        ],
      ),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.deepPurple.shade800,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type:BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon:Icon(Icons.home),
        label: "home"),
        BottomNavigationBarItem(icon:Icon(Icons.favorite_outline),
            label: "Favourite"),
        BottomNavigationBarItem(icon:Icon(Icons.play_circle_outline),
            label: "Play"),
        BottomNavigationBarItem(icon:Icon(Icons.people_outline),
            label: "Profile")
      ],
    );
  }
}
class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded,color: Colors.white,),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHVzZXJ8ZW58MHx8MHx8fDA%3D"
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}


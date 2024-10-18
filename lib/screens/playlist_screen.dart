import 'package:flutter/material.dart';
import '../model/playlist_model.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlayList playList = PlayList.playlist[0];
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Playlist'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _PlaylistInformation(playList: playList),
                const SizedBox(
                  height: 30,
                ),
                const PlayOrShuffleSwitch(),
                _PlaylistSongs(playList: playList)
              ],
            ),
          ),
        ),
      ),  
    );
  }
}

class _PlaylistSongs extends StatelessWidget {
  const _PlaylistSongs({
    super.key,
    required this.playList,
  });

  final PlayList playList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: playList.songs.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(
              '${index + 1}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            title: Text(
              playList.songs[index].title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              playList.songs[index].description +'  2:45',
            ),
            trailing: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            );
        });
  }
}

class PlayOrShuffleSwitch extends StatefulWidget {
  const PlayOrShuffleSwitch({
    super.key,
  });

  @override
  State<PlayOrShuffleSwitch> createState() => _PlayOrShuffleSwitchState();
}

class _PlayOrShuffleSwitchState extends State<PlayOrShuffleSwitch> {
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () {
          setState(() {
            isPlay = !isPlay;
          });
        },
        child: Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
          child: Stack(children: [
            AnimatedPositioned(
                left: isPlay ? 0 : width * 0.45,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  height: 50,
                  width: width * 0.45,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(15.0)),
                )),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Play',
                          style: TextStyle(
                            fontSize: 17,
                            color: isPlay ? Colors.white : Colors.deepPurple,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.play_circle,
                        color: isPlay ? Colors.white : Colors.deepPurple,
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Shuffle',
                        style: TextStyle(
                            fontSize: 17,
                            color: isPlay ? Colors.deepPurple : Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.shuffle,
                      color: isPlay ? Colors.deepPurple : Colors.white,
                    )
                  ],
                )),
              ],
            ),
          ]),
        ));
  }
}

class _PlaylistInformation extends StatelessWidget {
  const _PlaylistInformation({
    super.key,
    required this.playList,
  });

  final PlayList playList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            playList.imageUrl,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          playList.title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

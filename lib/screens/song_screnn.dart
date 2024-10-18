import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import '../model/songs_model.dart';
import '../widget/player_buttons.dart';
import '../widget/seekbar.dart';
class SongScreen extends StatefulWidget {
   const SongScreen({Key? key,}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
   Song songs = Get.arguments ?? Song.songs[0];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(children: [
        AudioSource.uri(Uri.parse(
          'asset:///${songs.url}'
      )),
        AudioSource.uri(Uri.parse(
            'asset:///${Song.songs[1].url}'
        ))
      ])
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }
  Stream<SeekBarData> get _seekBarDataStream =>
  rxdart.Rx.combineLatest2<Duration,Duration?,SeekBarData>(
    audioPlayer.positionStream,
    audioPlayer.durationStream,
      (Duration position,Duration? duration,){
      return SeekBarData(duration: duration ?? Duration.zero,
          position: position);
      }

  );

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(songs.coverUrl,fit:BoxFit.cover,),
          const BackgroundFilterWidget(),
          MusicPlayer(
            song:songs,
              seekBarDataStream: _seekBarDataStream, audioPlayer: audioPlayer)
        ],
      ),
    );
  }
}

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({
    super.key,
    required Stream<SeekBarData> seekBarDataStream,
    required this.song,
    required this.audioPlayer,
  }) : _seekBarDataStream = seekBarDataStream;

  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;
  final Song song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,
          vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            song.title,
            style:Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.bold
            )
          ),
          const SizedBox(height: 10.0,),
          Text(
              song.description,
              style:Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold
              )
          ),
          const SizedBox(height: 30.0,),
          StreamBuilder<SeekBarData>(
            stream: _seekBarDataStream,
              builder: (context,snapshot){
              final positionData = snapshot.data;
              return SeekBar(
                  position: positionData?.position ?? Duration.zero,
                  duration: positionData?.duration ?? Duration.zero,
              onChanged: audioPlayer.seek,);
          }),
          PlayerButtons(audioPlayer: audioPlayer),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed:(){},
                iconSize: 35,
                icon:const Icon(Icons.settings),
                color: Colors.white,
              ),
             IconButton(
               onPressed: (){},
                 iconSize: 35,
              icon: const Icon(Icons.cloud_download,
              color: Colors.white,
              ))
            ],
          )
        ],
      ),
    );
  }
}



class BackgroundFilterWidget extends StatelessWidget {
  const BackgroundFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect){
        return LinearGradient(
          colors:[
            Colors.white,
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0.0)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0,0.4,0.6]
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[ Colors.deepPurple.shade200,
              Colors.deepPurple.shade800
            ],
            begin:Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
      ),
    );
  }
}

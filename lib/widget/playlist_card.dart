import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/playlist_model.dart';

class PlayListCard extends StatelessWidget {
  const PlayListCard({
    super.key,
    required this.playList,
  });

  final PlayList playList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed("/playlist",arguments: playList);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade800.withOpacity(0.6),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius:BorderRadius.circular(15.0),
              child: Image.network(
                playList.imageUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,),
            ),
            const SizedBox(width: 20,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(playList.title,
                      style: Theme.of(context).textTheme!.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold
                      )),
                  Text('${playList.songs.length} songs',
                    style: Theme.of(context).textTheme!.bodySmall,
                  )
                ],
              ),
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.play_circle,color: Colors.white,))
          ],
        ),
      ),
    );
  }
}
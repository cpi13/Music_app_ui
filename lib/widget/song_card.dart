import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../model/songs_model.dart';
class SongsCard extends StatelessWidget {
  const SongsCard({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed("/song",arguments: song);
      },
      child: Container(
        padding: const EdgeInsets.only(right: 10.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children:[Container(
            width: MediaQuery.of(context).size.width*0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: AssetImage(song.coverUrl),
                  fit: BoxFit.cover
              ),
            ),
          ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width*0.37,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white.withOpacity(0.8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(song.title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold
                      ),),
                      Text(
                        song.description,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  const Icon(Icons.play_circle,color: Colors.deepPurple,)
                ],
              ),
            ),]
        ),
      ),
    );
  }
}
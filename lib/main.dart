import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:music_app_ui/screens/home_screen.dart';
import 'package:music_app_ui/screens/playlist_screen.dart';
import 'package:music_app_ui/screens/song_screnn.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white
        )
      ),
      home:HomeScreen(),
      getPages: [
        GetPage(name: "/", page:()=> const HomeScreen()),
        GetPage(name: "/song", page:()=>  SongScreen()),
        GetPage(name: "/playlist", page:()=> const PlaylistScreen()),
      ],
    );
  }
}


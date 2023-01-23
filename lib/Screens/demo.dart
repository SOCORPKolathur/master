import 'package:better_player/better_player.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';


class demo extends StatelessWidget {
  demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo for country picker')),
      body: BetterPlayer.network(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"
        ,betterPlayerConfiguration: BetterPlayerConfiguration(
        aspectRatio: 16 / 9,
      ),)
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sound_player/components/PlaySongHeaderButton.dart';
import 'package:my_sound_player/components/SongAndVolume.dart';
import 'package:my_sound_player/components/SongControllerButton.dart';
import 'package:my_sound_player/components/SongDetails.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

class PlaySongPage extends StatelessWidget {

  const PlaySongPage({super.key,});


  @override
  Widget build(BuildContext context) {
  var value = 20.0;
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 10),
              PlaySongHeaderButton(),
              SizedBox(height: 10),
              SongAndValume(),
              SizedBox(height: 20),
              SongDetails(
          
              ),
              SizedBox(height: 10),
              Spacer(),
              SongControllerButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

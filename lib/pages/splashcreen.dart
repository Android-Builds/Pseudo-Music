import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pseudomusic/ui/home/homepage.dart';
import 'package:pseudomusic/utils/variables.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  fetchSongs() {
    //songs = await MusicFinder.allSongs();
    songs = audioQuery.getSongs();
  }

  @override
  void initState() {
    super.initState();
    //  songModel2 = new SongModel();
    getuColors();
    fetchSongs();
    Timer(Duration(seconds: 2), () {
      Route route = MaterialPageRoute(builder: (context) => HomePage2());
      Navigator.pushReplacement(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Music',
                  style: TextStyle(
                      color: getColor(context),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ShadowsIntoLight',
                      letterSpacing: 3.0),
                ),
                SizedBox(height: 30.0),
                Icon(
                  Feather.music,
                  size: 40.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

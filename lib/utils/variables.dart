import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

int r, ur;
int g, ug;
int b, ub;
double o, uo;

Brightness brightness;

Future<List<SongInfo>> songs;
List<SongInfo> musics = new List<SongInfo>();
// List<Song> savedsongs = new List<Song>();
bool disco = false;
bool disco2 = false;
bool randomcol = false;
bool darkmode = false;
bool homepagedisco = false;
bool usenavrails = true;
bool usetabbar = false;

StreamController discoController;
StreamController uiController;

getColor(BuildContext context) {
  var brightness = MediaQuery.of(context).platformBrightness;
  if (brightness == Brightness.dark)
    return Colors.white;
  else
    return Colors.black;
}

getuColors() {
  ur = Random().nextInt(255);
  ug = Random().nextInt(255);
  ub = Random().nextInt(255);
  uo = Random().nextDouble();
}

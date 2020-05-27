import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

Future<List<SongInfo>> songs;
List<SongInfo> musics = new List<SongInfo>();
// List<Song> savedsongs = new List<Song>();
bool disco = false;
bool disco2 = false;
bool randomcol = false;
bool darkmode = false;

getColor(BuildContext context) {
  var brightness = MediaQuery.of(context).platformBrightness;
  if (brightness == Brightness.dark)
    return Colors.white;
  else
    return Colors.black;
}
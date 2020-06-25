import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:pseudomusic/utils/constants.dart';

int r, ur;
int g, ug;
int b, ub;
double o, uo;

Brightness brightness;
Color currentColor = Colors.limeAccent;
NavBarPrefs navpref = NavBarPrefs.bottom;
DiscoModes discomode = DiscoModes.unison;
DiscoModeStatus modeStatus = DiscoModeStatus.always;

Future<List<SongInfo>> songs;
List<SongInfo> musics = new List<SongInfo>();
// List<Song> savedsongs = new List<Song>();
bool disco = false;
bool disco1 = false;
bool disco2 = false;
bool randomcol = false;
bool darkmode = false;
bool homepagedisco = false;

bool usenavrails = false;
bool usetabbar = false;

StreamController discoController;
StreamController uiController;

StreamController listdiscoController;

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

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:pseudomusic/utils/constants.dart';

int r, ur;
int g, ug;
int b, ub;
double o, uo;

Color uicolor;

TabController tabController;

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

StreamController discoController;

StreamController listdiscoController;

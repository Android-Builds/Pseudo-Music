import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pseudomusic/utils/variables.dart';

enum NavBarPrefs { rails, tab, bottom }

enum DiscoModes { unison, random }

enum DiscoModeStatus { always, onplay }

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

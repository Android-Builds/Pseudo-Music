import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pseudomusic/pages/settings.dart';
import 'package:pseudomusic/utils/variables.dart';
import 'package:pseudomusic/widgets/songlist.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Timer t;

  List<Widget> _widgetOptions = <Widget>[
    Container(
      child: SongList(),
    ),
    Container(),
    Container(
      child: Text('Hello'),
    ),
    SettingsPage(),
  ];

  updateColors2() {
    t = Timer.periodic(const Duration(milliseconds: 500), (Timer t) {
      setState(() {
        r = ur = Random().nextInt(255);
        g = ug = Random().nextInt(255);
        b = ub = Random().nextInt(255);
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    super.initState();
    discoController = new StreamController();
    uiController = new StreamController();
    discoController.stream.listen((event) {
      if (event) {
        updateColors2();
      } else if (t != null && t.isActive) {
        t.cancel();
      } else {
        setState(() {});
      }
    });
    uiController.stream.listen((event) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      statusBarIconBrightness: Brightness.dark, //top bar icons
      systemNavigationBarColor: Colors.black, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ));
    return Scaffold(
      body: usenavrails
          ? Row(
              children: [
                NavigationRail(
                  groupAlignment: 1.0,
                  destinations: <NavigationRailDestination>[
                    NavigationRailDestination(
                      icon: Icon(Ionicons.ios_musical_note),
                      selectedIcon: Icon(Ionicons.ios_musical_note),
                      label: Text('Songs'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(MaterialCommunityIcons.playlist_music_outline),
                      selectedIcon: Icon(MaterialCommunityIcons.playlist_music),
                      label: Text('Playlists'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Ionicons.ios_albums),
                      selectedIcon: Icon(Ionicons.ios_albums),
                      label: Text('Albums'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Ionicons.ios_settings),
                      selectedIcon: Icon(Ionicons.ios_settings),
                      label: Text('Albums'),
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: _onItemTapped,
                  labelType: NavigationRailLabelType.selected,
                  selectedLabelTextStyle:
                      TextStyle(color: Color.fromRGBO(ur, ug, ub, 1)),
                  selectedIconTheme:
                      IconThemeData(color: Color.fromRGBO(ur, ug, ub, 1)),
                ),
                VerticalDivider(
                  thickness: 2,
                ),
                Expanded(
                  child: _widgetOptions.elementAt(_selectedIndex),
                )
              ],
            )
          : Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
      bottomNavigationBar: !usenavrails ? BottomNavigationBar(
              elevation: 0.0,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.music_note),
                  title: Text('Songs'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.playlist_play),
                  title: Text('Playlist'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.album),
                  title: Text('Albums'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Color.fromRGBO(ur, ug, ub, 1),
              onTap: _onItemTapped,
            ) : Container(height: 0) ,
    );
  }
}

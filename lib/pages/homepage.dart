import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    )
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
    discoController.stream.listen((event) {
      if (event) {
        updateColors2();
      } else if (t != null && t.isActive) {
        t.cancel();
      }
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(ur, ug, ub, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pseudomusic/ui/global/theme/bloc/bloc.dart';
import 'package:pseudomusic/ui/preference/preference_page.dart';
import 'package:pseudomusic/utils/variables.dart';
import 'package:pseudomusic/widgets/songlist.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2>
    with SingleTickerProviderStateMixin {
  Timer t;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  updateColors() {
    t = Timer.periodic(const Duration(milliseconds: 500), (Timer t) {
      setState(() {
        // r = ur = Random().nextInt(255);
        // g = ug = Random().nextInt(255);
        // b = ub = Random().nextInt(255);
      });
    });
  }

  checkParams() {
    if (homepagedisco) {
      updateColors();
    }
  }

  discoCtrl() {
    discoController.stream.listen((event) {
      if (event) {
        updateColors();
      } else if (t != null && t.isActive) {
        t.cancel();
      } else {
        setState(() {});
      }
    });
  }

  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    discoCtrl();
    checkParams();
  }

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

  @override
  Widget build(BuildContext context) {
    uicolor =
        disco ? Color.fromRGBO(ur, ug, ub, 1) : Theme.of(context).primaryColor;
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          return SafeArea(
            child: Scaffold(
              body: _widgetOptions.elementAt(
                _selectedIndex,
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
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                ],
                currentIndex: _selectedIndex,
                unselectedItemColor: Colors.grey,
                selectedItemColor: uicolor,
                onTap: _onItemTapped,
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pseudomusic/ui/preference/preference_page.dart';
import 'package:pseudomusic/utils/variables.dart';
import 'package:pseudomusic/widgets/songlist.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  Timer t;
  TabController _tabController;
  Color uicolor;

  List<Widget> _widgetOptions = <Widget>[
    Container(
      child: SongList(),
    ),
    Container(),
    Container(
      child: Text('Hello'),
    ),
    PreferencePage(),
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
    _tabController = TabController(length: 3, vsync: this);
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
    uicolor = disco || disco2
        ? Color.fromRGBO(ur, ug, ub, 1)
        : Theme.of(context).accentColor;
    return SafeArea(
      child: Scaffold(
        appBar: usetabbar
            ? PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: uicolor,
                  tabs: [
                    Tab(icon: Icon(Icons.music_note)),
                    Tab(
                      icon: Icon(Icons.playlist_play),
                    ),
                    Tab(
                      icon: Icon(Icons.settings),
                    )
                  ],
                  controller: _tabController,
                  indicatorColor: uicolor,
                ),
              )
            : PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: Container(height: 0),
              ),
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
                        icon:
                            Icon(MaterialCommunityIcons.playlist_music_outline),
                        selectedIcon:
                            Icon(MaterialCommunityIcons.playlist_music),
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
                        label: Text('Settings'),
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: _onItemTapped,
                    labelType: NavigationRailLabelType.selected,
                    selectedLabelTextStyle: TextStyle(color: uicolor),
                    selectedIconTheme: IconThemeData(color: uicolor),
                  ),
                  VerticalDivider(
                    thickness: 2,
                  ),
                  Expanded(
                    child: _widgetOptions.elementAt(
                      _selectedIndex,
                    ),
                  )
                ],
              )
            : usetabbar
                ? TabBarView(
                    children: [
                      Container(
                        child: SongList(),
                      ),
                      Container(
                        child: Text('Hello'),
                      ),
                      PreferencePage(),
                    ],
                    controller: _tabController,
                  )
                : Center(
                    child: _widgetOptions.elementAt(_selectedIndex),
                  ),
        bottomNavigationBar: !usenavrails && !usetabbar
            ? BottomNavigationBar(
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
              )
            : Container(
                height: 0,
              ),
      ),
    );
  }
}

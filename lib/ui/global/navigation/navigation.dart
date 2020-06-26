import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pseudomusic/ui/preference/preference_page.dart';
import 'package:pseudomusic/utils/variables.dart';
import 'package:pseudomusic/widgets/songlist.dart';

enum Navigation {
  Tabbar,
  Navbar,
  NavigationRails,
}

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

class NavView extends StatefulWidget {
  @override
  _NavViewState createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

class TabView extends StatefulWidget {
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
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
          controller: tabController,
          indicatorColor: uicolor,
        ),
      ),
      body: TabBarView(
        children: [
          Container(
            child: SongList(),
          ),
          Container(
            child: Text('Hello'),
          ),
          PreferencePage(),
        ],
        controller: tabController,
      ),
    );
  }
}

class RailsView extends StatefulWidget {
  @override
  _RailsViewState createState() => _RailsViewState();
}

class _RailsViewState extends State<RailsView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
      ),
    );
  }
}

final homeWidget = {
  //
  Navigation.Navbar: NavView(),
  //
  Navigation.Tabbar: TabView(),
  //
  Navigation.NavigationRails: RailsView(),
};

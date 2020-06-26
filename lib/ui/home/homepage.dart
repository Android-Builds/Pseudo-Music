import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pseudomusic/ui/global/navigation/bloc/navigation_bloc.dart';
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
    tabController = TabController(length: 3, vsync: this);
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
        : Theme.of(context).primaryColor;
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (BuildContext context, NavigationState state) {
        return SafeArea(
          child: state.homeWidget,
        );
      }),
    );
  }
}

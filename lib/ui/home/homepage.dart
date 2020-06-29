import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pseudomusic/ui/global/navigation/bloc/navigation_bloc.dart';
import 'package:pseudomusic/ui/global/navigation/navigation.dart';
import 'package:pseudomusic/ui/global/theme/bloc/bloc.dart';
import 'package:pseudomusic/utils/variables.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2>
    with SingleTickerProviderStateMixin {
  Timer t;

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

  NavigationBloc _navigationBloc = NavigationBloc();

  @override
  void dispose() {
    _navigationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    uicolor =
        disco ? Color.fromRGBO(ur, ug, ub, 1) : Theme.of(context).primaryColor;
    return BlocProvider(
        create: (context) => NavigationBloc(),
        child: BlocListener<ThemeBloc, ThemeState>(
          bloc: ThemeBloc(),
          listener: (context, state) {
            if (state is ThemeChanged) {
              _navigationBloc.add(
                  NavigationChanged(homeWidget: homeWidget[Navigation.Navbar]));
            }
          },
          child: BlocBuilder<NavigationBloc, NavigationState>(
              builder: (BuildContext context, NavigationState state) {
            return SafeArea(
              child: state.homeWidget,
            );
          }),
        )

        // child: BlocBuilder<NavigationBloc, NavigationState>(
        //     builder: (BuildContext context, NavigationState state) {
        //   return SafeArea(
        //     child: state.homeWidget,
        //   );
        // }),
        );
  }
}

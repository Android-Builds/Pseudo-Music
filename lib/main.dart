import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pseudomusic/pages/splashcreen.dart';

import 'ui/global/theme/bloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: state.themeData,
      //darkTheme: state.themeData.copyWith(brightness: Brightness.dark),
      theme: ThemeData(
        accentColor: state.themeData,
      ),
      home: SplashScreen(),
    );
  }
}

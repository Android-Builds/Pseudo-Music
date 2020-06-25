import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  ThemeEvent([List props = const <dynamic>[]]) : super();
}

class ThemeChanged extends ThemeEvent {
  final ThemeData theme;

  ThemeChanged({
    @required this.theme,
  }) : super([theme]);

  @override
  List<Object> get props => props;
}

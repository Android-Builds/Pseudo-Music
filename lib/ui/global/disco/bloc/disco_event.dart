import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class DiscoEvent extends Equatable {
  DiscoEvent([List props = const <dynamic>[]]) : super();
}

class DiscoMode extends DiscoEvent {
  final bool isOn;

  DiscoMode({@required this.isOn}) : super([isOn]);

  @override
  List<Object> get props => props;
}

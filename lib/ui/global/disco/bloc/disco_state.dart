import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DiscoState extends Equatable {
  final bool isOn;

  DiscoState({@required this.isOn}) : super();

  @override
  List<Object> get props => [isOn];
}

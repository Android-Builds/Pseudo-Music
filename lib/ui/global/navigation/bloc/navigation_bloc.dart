import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  @override
  NavigationState get initialState => NavigationInitial();

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

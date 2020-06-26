import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pseudomusic/ui/global/navigation/navigation.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  @override
  NavigationState get initialState =>
      NavigationState(homeWidget: homeWidget[Navigation.Navbar]);

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    if (event is NavigationChanged) {
      yield NavigationState(homeWidget: event.homeWidget);
    }
  }
}

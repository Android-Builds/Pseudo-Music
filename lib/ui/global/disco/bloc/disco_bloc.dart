import 'dart:async';
import 'package:bloc/bloc.dart';
import 'discobloc.dart';

class DiscoBloc extends Bloc<DiscoEvent, DiscoState> {
  @override
  DiscoState get initialState => DiscoState(isOn: false);

  @override
  Stream<DiscoState> mapEventToState(
    DiscoEvent event,
  ) async* {
    if (event is DiscoMode) {
      yield DiscoState(isOn: event.isOn);
    }
  }
}

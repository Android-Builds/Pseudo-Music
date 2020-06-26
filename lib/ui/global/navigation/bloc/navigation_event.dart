part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent([List props = const <dynamic>[]]) : super();
}

class NavigationChanged extends NavigationEvent {
  final Widget homeWidget;

  NavigationChanged({@required this.homeWidget});

  @override
  List<Object> get props => throw UnimplementedError();
}

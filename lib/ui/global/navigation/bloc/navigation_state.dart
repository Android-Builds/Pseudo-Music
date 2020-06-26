part of 'navigation_bloc.dart';

@immutable
class NavigationState extends Equatable {
  final Widget homeWidget;

  NavigationState({@required this.homeWidget}) : super();

  @override
  List<Object> get props => [homeWidget];
}

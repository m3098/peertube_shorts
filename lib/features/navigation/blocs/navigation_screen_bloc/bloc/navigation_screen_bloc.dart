import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_screen_event.dart';
part 'navigation_screen_state.dart';

class NavigationScreenBloc extends Bloc<NavigationScreenEvent, NavigationScreenState> {
  NavigationScreenBloc() : super(NavigationScreenInitial()) {
    on<NavigationScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

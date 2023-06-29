import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'discover_screen_event.dart';
part 'discover_screen_state.dart';

class DiscoverScreenBloc extends Bloc<DiscoverScreenEvent, DiscoverScreenState> {
  DiscoverScreenBloc() : super(DiscoverScreenInitial()) {
    on<DiscoverScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

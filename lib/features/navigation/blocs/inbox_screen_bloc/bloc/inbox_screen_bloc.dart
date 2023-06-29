import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'inbox_screen_event.dart';
part 'inbox_screen_state.dart';

class InboxScreenBloc extends Bloc<InboxScreenEvent, InboxScreenState> {
  InboxScreenBloc() : super(InboxScreenInitial()) {
    on<InboxScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'upload_screen_event.dart';
part 'upload_screen_state.dart';

class UploadScreenBloc extends Bloc<UploadScreenEvent, UploadScreenState> {
  UploadScreenBloc() : super(UploadScreenInitial()) {
    on<UploadScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

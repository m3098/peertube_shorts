import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'account_screen_event.dart';
part 'account_screen_state.dart';

class AccountScreenBloc extends Bloc<AccountScreenEvent, AccountScreenState> {
  AccountScreenBloc() : super(AccountScreenInitial()) {
    on<AccountScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

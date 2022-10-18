import 'package:bloc/bloc.dart';
import 'package:snap_chat_copy/repositiry/validation_repository.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  ValidationRepo validRepo = ValidationRepo();
  PasswordBloc({required this.validRepo}) : super(PasswordInitial()) {
    on<PassEvent>(_onPassEvent);
  }

  Future<void> _onPassEvent(PassEvent event, Emitter emit) async {
    emit(PassState(
        IsPasswordValid: validRepo.passwordValidation(event.password)));
  }
}

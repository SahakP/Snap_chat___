import 'package:bloc/bloc.dart';
import 'package:snap_chat_copy/repositiry/validation_repository.dart';

part 'username_event.dart';
part 'username_state.dart';

class UsernameBloc extends Bloc<UsernameEvent, UsernameState> {
  ValidationRepo validRepo = ValidationRepo();
  UsernameBloc({required this.validRepo}) : super(UsernameInitial()) {
    on<UsernaemEvent>(_onUsernaemEvent);
  }

  Future<void> _onUsernaemEvent(UsernaemEvent event, Emitter emitter) async {
    emitter(UsernaemState(
        isUsernameValid: validRepo.isUsernameValid(event.username)));
  }
}

import 'package:bloc/bloc.dart';
import 'package:snap_chat_copy/model/user_model.dart';
import 'package:snap_chat_copy/model/user_storage.dart';
import 'package:snap_chat_copy/repositiry/validation_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  User user = User();
  User? findUser;
  ValidationRepo validRepo = ValidationRepo();

  LoginBloc({required this.validRepo}) : super(LoginInitialState()) {
    on<NameTFEvent>(_onNameTFEvent);
    on<PasswordTFEvent>(_onPasswordTFEvent);
    on<LogInButtonEvent>(_onLogInButtonEvent);
  }

  Future<void> _onNameTFEvent(NameTFEvent event, Emitter emit) async {
    emit(UserNameState(isNameValid: validRepo.nameValidation(event.userName)));
  }

  Future<void> _onPasswordTFEvent(PasswordTFEvent event, Emitter emit) async {
    emit(PasswordState(
        IsPasswordValid: validRepo.passwordValidation(event.password)));
  }

  Future<void> _onLogInButtonEvent(LogInButtonEvent event, Emitter emit) async {
    emit(ButtonState(
        user: validRepo.isUserCorect(event.userName, event.password)));
  }

  // bool _nameValidation(String userName) {
  //   return userName.isNotEmpty;
  // }

  // bool _passwordValidation(String password) {
  //   return password.length > 7;
  // }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snap_chat_copy/repositiry/api_repo.dart';

import '../../model/user_model.dart';

part 'start_event.dart';
part 'start_state.dart';

class StartBloc extends Bloc<StartEvent, StartState> {
  StartBloc() : super(StartInitial()) {
    on<StartEvent>((event, emit) {
      on<IsRegEvent>(_isRegEvent);
    });
  }

  Future<void> _isRegEvent(IsRegEvent event, Emitter emit) async {
    final tokenPref = await SharedPreferences.getInstance();
    final token = tokenPref.getString('token');
    if (token != null) {
      emit(IsRegState(isReg: true, user: await ApiRepo().getUserPage()));
    } else {
      emit(IsRegState(isReg: false, user: null));
    }
  }
}

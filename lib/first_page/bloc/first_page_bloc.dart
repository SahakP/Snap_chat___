import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'first_page_event.dart';
part 'first_page_state.dart';

class FirstPageBloc extends Bloc<FirstPageEvent, FirstPageState> {
  FirstPageBloc() : super(FirstPageInitial()) {
    on<FirstPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

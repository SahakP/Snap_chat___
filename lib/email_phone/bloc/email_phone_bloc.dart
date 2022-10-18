import 'package:bloc/bloc.dart';
import 'package:snap_chat_copy/model/country.dart';
import 'package:snap_chat_copy/repositiry/api_repository.dart';
import 'package:snap_chat_copy/repositiry/validation_repository.dart';

part 'email_phone_event.dart';
part 'email_phone_state.dart';

class EmailPhoneBloc extends Bloc<EmailPhoneEvent, EmailPhoneState> {
  var location;
  var countyries;

  ApiRepository apiRepository = ApiRepository();
  ValidationRepo validRepo = ValidationRepo();
  EmailPhoneBloc({required this.apiRepository, required this.validRepo})
      : super(EmailPhoneInitial()) {
    on<EmailEvent>(_onEmailEvent);
    on<EmailPhoneLoadCountresEvent>(_loadCountries);
    on<PhoneEvent>(_onPhoneEvent);
  }

  Future<void> _onEmailEvent(EmailEvent event, Emitter emitter) async {
    emitter(EmailState(isEmailValid: validRepo.isEmailValid(event.email)));
  }

  Future<void> _onPhoneEvent(PhoneEvent event, Emitter emitter) async {
    emitter(
        PhoneState(isPhoneValid: validRepo.nameValidation(event.phoneNumber)));
  }

  Future<void> _loadCountries(
      EmailPhoneLoadCountresEvent event, Emitter emitter) async {
    emitter(LoadingState());
    countyries = await apiRepository.loadCountries();
    location = await apiRepository.loadLocation();
    final userLocation = countyries
        .firstWhere((Country country) => country.iso2_cc.contains(location));
    emitter(EmailPhoneLoadCountresState(
        countries: countyries, currentLocation: userLocation));
  }
}

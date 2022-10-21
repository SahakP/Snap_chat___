import 'package:bloc/bloc.dart';
import 'package:snap_chat_copy/model/country_model.dart';
import 'package:snap_chat_copy/repositiry/country_repo.dart';
import 'package:snap_chat_copy/repositiry/validation_repository.dart';

part 'email_phone_event.dart';
part 'email_phone_state.dart';

class EmailPhoneBloc extends Bloc<EmailPhoneEvent, EmailPhoneState> {
  ValidationRepo validRepo = ValidationRepo();
  CountryRepo countryRepo = CountryRepo();

  EmailPhoneBloc({required this.countryRepo, required this.validRepo})
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
    emitter(EmailPhoneLoadCountresState(
        countries: await countryRepo.getCountries(),
        currentLocation: await countryRepo.getCountry()));
  }
}

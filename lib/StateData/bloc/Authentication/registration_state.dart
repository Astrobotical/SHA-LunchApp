part of 'registration_cubit.dart';

class RegistrationState {
  ButtonState buttonState;
  RegistrationState({required this.buttonState});
}

class RegistrationInitial extends RegistrationState {
  RegistrationInitial({required super.buttonState});
}
class RegistrationSuccess extends RegistrationState{
  RegistrationSuccess({required super.buttonState});
}
class RegistrationContinue extends RegistrationState{
  RegistrationContinue({required super.buttonState});
}
class RegistrationFailure extends RegistrationState{
  String error;
  RegistrationFailure({ required this.error, required super.buttonState});
}
class RegistrationLoading extends RegistrationState{
  RegistrationLoading ({required super.buttonState});
}
class RegistrationAccountExists extends RegistrationState{
  RegistrationAccountExists({required super.buttonState});
}
class RegistrationRefresh extends RegistrationState{
  RegistrationRefresh({required super.buttonState});
}
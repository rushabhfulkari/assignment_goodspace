part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpInitialEvent extends SignUpEvent {}

class SignUpGetOtpButtonClickedEvent extends SignUpEvent {
  final String phoneNumber;

  const SignUpGetOtpButtonClickedEvent(this.phoneNumber);
}

class SignUpVerifyOtpButtonClickedEvent extends SignUpEvent {
  final String phoneNumber;
  final String code;
  final SignUpBloc signUpBloc;

  const SignUpVerifyOtpButtonClickedEvent(
    this.phoneNumber,
    this.code,
    this.signUpBloc,
  );
}

class SignUpGoBackButtonClickedEvent extends SignUpEvent {
  final SignUpBloc signUpBloc;
  const SignUpGoBackButtonClickedEvent({
    required this.signUpBloc,
  });
}

class SignUpOtpSentEvent extends SignUpEvent {}

class SignUpOtpInvalidEvent extends SignUpEvent {}

class SignUpMobileNumberInvalidEvent extends SignUpEvent {}

class SignUpEditMobileNumberEvent extends SignUpEvent {}

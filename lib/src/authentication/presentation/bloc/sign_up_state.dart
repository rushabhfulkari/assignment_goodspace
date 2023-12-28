// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: unused_field

part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

final class SignUpInitial extends SignUpState {}

abstract class SignUpActionState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpErrorState extends SignUpState {}

class SignUpOtpState extends SignUpState {}

class SignUpPageNavigateToDashboardActionState extends SignUpActionState {}

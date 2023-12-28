import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../services/user_signed_in_check.dart';
import '../../data/datasources/authentication_data_source.dart';
import 'package:http/http.dart' as http;

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpInitialEvent>((event, emit) {
      emit(const SignUpState());
    });
    on<SignUpGetOtpButtonClickedEvent>((event, emit) async {
      emit(SignUpLoadingState());

      final result = await AuthenticationDataSourceImplementation(http.Client())
          .loginUser(mobileNumber: event.phoneNumber, countryCode: "+91");

      if (result == "Successful") {
        emit(SignUpOtpState());
      } else {
        emit(const SignUpState());
      }
    });
    on<SignUpGoBackButtonClickedEvent>((event, emit) {
      emit(const SignUpState());
    });
    on<SignUpEditMobileNumberEvent>((event, emit) {
      emit(const SignUpState());
    });

    on<SignUpVerifyOtpButtonClickedEvent>((event, emit) async {
      emit(SignUpLoadingState());

      final result = await AuthenticationDataSourceImplementation(http.Client())
          .verifyOtp(mobileNumber: event.phoneNumber, otp: event.code);

      if (result == "Successful") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        loggedIn = true;
        prefs.setBool('loggedIn', true);

        emit(SignUpPageNavigateToDashboardActionState());
      } else {
        emit(const SignUpState());
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../dashboard/presentation/widgets/navigation_bar.dart';
import '../bloc/sign_up_bloc.dart';
import '../widgets/build_loading_widget.dart';
import 'dart:math';
import '../widgets/sign_up_state_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpBloc _signUpBloc = SignUpBloc();
  FocusNode mobileNumberFocusNode = FocusNode();
  FocusNode popUpMobileNumberFocusNode = FocusNode();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController popUpMobileNumberController = TextEditingController();

  Random random = Random();

  int imageNumber = 0;

  @override
  void initState() {
    imageNumber = random.nextInt(3);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return BlocConsumer<SignUpBloc, SignUpState>(
      bloc: _signUpBloc,
      listener: (context, state) {
        if (state is SignUpPageNavigateToDashboardActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyNavigationBar()));
        }
      },
      listenWhen: (previous, current) => current is SignUpActionState,
      buildWhen: (previous, current) => current is! SignUpActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case SignUpLoadingState:
            return const LoadingStateWidget();
          case SignUpErrorState:
            return const ErrorStateWidget();
          case SignUpOtpState:
            return SignUpOtpStateWidget(
              height: height,
              width: width,
              signUpBloc: _signUpBloc,
              mobileNumberController: mobileNumberController,
              popUpMobileNumberController: popUpMobileNumberController,
              popUpMobileNumberFocusNode: popUpMobileNumberFocusNode,
            );
          default:
            return SignUpDefaultStateWidget(
              height: height,
              width: width,
              imageNumber: imageNumber,
              size: size,
              mobileNumberController: mobileNumberController,
              mobileNumberFocusNode: mobileNumberFocusNode,
              signUpBloc: _signUpBloc,
            );
        }
      },
    );
  }
}

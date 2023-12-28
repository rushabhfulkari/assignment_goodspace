import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: white,
        body: PopScope(
            canPop: false,
            child: Center(
                child: Text('Something went wrong',
                    style: TextStyle(
                      color: red,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )))));
  }
}

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: white,
        body: PopScope(
            canPop: false,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(primaryBlue),
              ),
            )));
  }
}

class DefaultStateWidget extends StatelessWidget {
  const DefaultStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: veryDarkGreyishBlue,
        body: const PopScope(canPop: false, child: Center(child: SizedBox())));
  }
}

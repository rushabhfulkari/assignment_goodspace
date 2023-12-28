import 'package:assignment_goodspace/src/authentication/presentation/bloc/sign_up_bloc.dart';
import 'package:assignment_goodspace/src/authentication/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../core/utils/colors.dart';
import 'flutter_otp_text_field.dart';
import 'text_field_widget.dart';

class SignUpDefaultStateWidget extends StatelessWidget {
  const SignUpDefaultStateWidget({
    super.key,
    required this.height,
    required this.width,
    required this.imageNumber,
    required this.size,
    required this.mobileNumberController,
    required this.mobileNumberFocusNode,
    required this.signUpBloc,
  });

  final double height;
  final double width;
  final int imageNumber;
  final Size size;
  final TextEditingController mobileNumberController;
  final FocusNode mobileNumberFocusNode;
  final SignUpBloc signUpBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset('assets/svg/signup$imageNumber.svg',
                    semanticsLabel: 'findwork'),
                SizedBox(
                  height: height * 0.15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Please enter your phone number to sign in\n',
                            style: TextStyle(
                              color: greyishBlue,
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'GoodSpace ',
                            style: TextStyle(
                              color: primaryBlue,
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'account.',
                            style: TextStyle(
                              color: greyishBlue,
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: grey98,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color.fromRGBO(196, 196, 196, 0.40),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 5,
                                left: 17,
                              ),
                              child: SizedBox(
                                width: 50,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/india_flag.png',
                                      height: 40,
                                      width: 30,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 1,
                                      color: const Color.fromRGBO(
                                          196, 196, 196, 0.40),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: textFormFieldWidgetMobileNumber(
                              size,
                              context,
                              mobileNumberController,
                              mobileNumberFocusNode,
                              'Please enter mobile no.',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'You will recieve a ',
                            style: TextStyle(
                              color: grey,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: '4 digit OTP',
                            style: TextStyle(
                              color: primaryBlue,
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: buttonRegular(() {
                          if (mobileNumberController.text.isEmpty ||
                              mobileNumberController.text.length < 10 ||
                              mobileNumberController.text.length > 10) {
                            showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.error(
                                message: 'Enter Correct phone number',
                              ),
                            );
                          } else {
                            signUpBloc.add(SignUpGetOtpButtonClickedEvent(
                              mobileNumberController.text.toString(),
                            ));
                          }
                        }, 'Get OTP'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpOtpStateWidget extends StatelessWidget {
  const SignUpOtpStateWidget({
    super.key,
    required this.height,
    required this.width,
    required this.signUpBloc,
    required this.mobileNumberController,
    required this.popUpMobileNumberController,
    required this.popUpMobileNumberFocusNode,
  });

  final double height;
  final double width;
  final SignUpBloc signUpBloc;
  final TextEditingController mobileNumberController;
  final TextEditingController popUpMobileNumberController;
  final FocusNode popUpMobileNumberFocusNode;

  @override
  Widget build(BuildContext context) {
    String verificationCodeHere = '';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      signUpBloc.add(SignUpGoBackButtonClickedEvent(
                          signUpBloc: signUpBloc));
                    },
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                        'assets/images/arrow_back.png',
                        height: 15,
                        width: 15,
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: Text(
                                  "Enter Correct Phone Number",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: black,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                backgroundColor: white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                content: SizedBox(
                                  height: height * 0.35,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: grey98,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: const Color.fromRGBO(
                                                196, 196, 196, 0.40),
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 10,
                                                ),
                                                child: SizedBox(
                                                  width: 50,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/india_flag.png',
                                                        height: 25,
                                                        width: 25,
                                                      ),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      Container(
                                                        height: 30,
                                                        width: 1,
                                                        color: const Color
                                                            .fromRGBO(196, 196,
                                                            196, 0.40),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 10,
                                              child:
                                                  textFormFieldWidgetMobileNumber(
                                                MediaQuery.of(context).size,
                                                context,
                                                popUpMobileNumberController,
                                                popUpMobileNumberFocusNode,
                                                'Please enter mobile no.',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Please be sure to select the correct area code and enter 10 digits.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            color: Color(0xff989BA4)),
                                      ),
                                      const SizedBox(
                                        height: 42,
                                      ),
                                      buttonRegular(() {
                                        if (popUpMobileNumberController
                                                .text.isEmpty ||
                                            popUpMobileNumberController
                                                    .text.length <
                                                10 ||
                                            popUpMobileNumberController
                                                    .text.length >
                                                10) {
                                          showTopSnackBar(
                                            Overlay.of(context),
                                            const CustomSnackBar.error(
                                              message:
                                                  'Enter Correct phone number',
                                            ),
                                          );
                                        } else {
                                          Navigator.pop(context);
                                          mobileNumberController.text =
                                              popUpMobileNumberController.text;
                                          signUpBloc.add(
                                              SignUpGetOtpButtonClickedEvent(
                                            popUpMobileNumberController.text
                                                .toString(),
                                          ));
                                        }
                                      }, 'Verify Phone'),
                                    ],
                                  ),
                                ));
                          });

                      // signUpBloc.add(SignUpEditMobileNumberEvent());
                    },
                    child: Row(
                      children: [
                        const Text(
                          'Edit Phone Number',
                          style: TextStyle(
                            color: Color(0xff6D6E71),
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/images/icon-edit-2.png',
                          height: 15,
                          width: 15,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'OTP sent to +91 ',
                          style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: '${mobileNumberController.text}\n',
                          style: TextStyle(
                            color: primaryBlue,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Enter OTP to confirm your phone',
                          style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('You’ll receive a four digit verification\ncode. ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: grey,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      OtpTextField(
                        numberOfFields: 4,
                        borderColor: primaryBlue,
                        cursorColor: blackLight.withOpacity(0.5),
                        showFieldAsBox: true,

                        onSubmit: (String verificationCode) {
                          verificationCodeHere = verificationCode;
                          signUpBloc.add(SignUpVerifyOtpButtonClickedEvent(
                              mobileNumberController.text,
                              verificationCode,
                              signUpBloc));
                        }, // end onSubmit
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Didn't receive OTP?  ",
                          style: TextStyle(
                            color: grey,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Resend',
                          style: TextStyle(
                            color: primaryBlue,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: buttonRegular(() {
                  signUpBloc.add(SignUpVerifyOtpButtonClickedEvent(
                      mobileNumberController.text,
                      verificationCodeHere,
                      signUpBloc));
                }, 'Verify Phone'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

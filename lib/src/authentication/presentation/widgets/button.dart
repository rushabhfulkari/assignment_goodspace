import 'package:assignment_goodspace/core/utils/colors.dart';
import 'package:flutter/material.dart';

ElevatedButton buttonRegular(onPressed, buttonText) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primaryBlue),
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(296, 56),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ))),
    child: Text(
      '$buttonText',
      style: const TextStyle(
        color: Color(0xffFAFAFA),
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

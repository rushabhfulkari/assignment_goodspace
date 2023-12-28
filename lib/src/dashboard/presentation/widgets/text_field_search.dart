import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

Widget textFieldSearch(size, context, controller, focusNode) {
  return TextFormField(
    controller: controller,
    focusNode: focusNode,
    scrollPadding: EdgeInsets.only(
      bottom: MediaQuery.of(context).viewInsets.bottom,
    ),
    keyboardType: TextInputType.text,
    cursorColor: black,
    style: TextStyle(
      fontSize: 16,
      fontFamily: 'Poppins',
      color: textBlack,
    ),
    decoration: InputDecoration(
      disabledBorder: buildTextFieldOutlineInputBorder(size),
      enabledBorder: buildTextFieldOutlineInputBorder(size),
      fillColor: const Color(0xffF2F2F2),
      prefixIcon: Image.asset(
        'assets/images/icon_search.png',
        height: 10,
        width: 10,
        color: primaryBlue,
      ),
      prefixIconConstraints: const BoxConstraints(
        minWidth: 40,
        minHeight: 25,
      ),
      focusedBorder: buildTextFieldOutlineInputBorder(size),
      errorBorder: buildTextFieldOutlineInputBorder(size),
      focusedErrorBorder: buildTextFieldOutlineInputBorder(size),
      contentPadding: const EdgeInsets.only(
        right: 16,
        top: 16,
        bottom: 16,
      ),
      filled: true,
      hintText: "Search Jobs",
      hintStyle: TextStyle(
        fontSize: 14,
        fontFamily: 'Poppins',
        color: grey,
      ),
    ),
    textInputAction: TextInputAction.next,
    onEditingComplete: () {
      FocusScope.of(context).unfocus();
    },
  );
}

OutlineInputBorder buildTextFieldOutlineInputBorder(size) {
  return OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: grey),
  );
}

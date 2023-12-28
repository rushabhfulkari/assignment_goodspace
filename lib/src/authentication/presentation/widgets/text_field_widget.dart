import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

Widget textFormFieldWidgetMobileNumber(
    size, context, controller, focusNode, hintText) {
  return TextFormField(
    controller: controller,
    focusNode: focusNode,
    scrollPadding: EdgeInsets.only(
      bottom: MediaQuery.of(context).viewInsets.bottom,
    ),
    keyboardType: TextInputType.number,
    cursorColor: black,
    style: TextStyle(
      fontSize: 16,
      color: textBlack,
      fontFamily: 'Poppins',
    ),
    decoration: InputDecoration(
      disabledBorder: buildTextFieldOutlineInputBorder(size),
      enabledBorder: buildTextFieldOutlineInputBorder(size),
      focusedBorder: buildTextFieldOutlineInputBorder(size),
      errorBorder: buildTextFieldOutlineInputBorder(size),
      focusedErrorBorder: buildTextFieldOutlineInputBorder(size),
      contentPadding: const EdgeInsets.only(
        right: 16,
        top: 16,
        bottom: 16,
      ),
      filled: false,
      hintText: "$hintText",
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
  return const OutlineInputBorder(
    borderSide: BorderSide(width: 0, color: Colors.transparent),
  );
}

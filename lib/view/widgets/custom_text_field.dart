// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_bloc/utils/style.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';
import '../../utils/colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      this.hintText,
      this.obscureText,
      this.textInputType,
      this.textInputAction,
      this.isBorder = true,
      this.height,
      this.width,
      this.validator,
      this.onChanged,
      this.onSubmitted,
      this.borderColor = azurePrimary,
      this.hintColor = greyLight,
      this.isPassword = false,
      this.isSearch = false,
      this.radius = 10,
      this.iconPadding = 16,
      this.fillColor = whitePrimary,
      this.isVisible = false,
      this.inputFormatter = 50,
      this.isEdit = false,
      this.isReadOnly = false,
      this.isPrefixIcon = false,
      this.onTap,
      this.label,
      this.suffixIcon,
      this.isSearchTap});

  TextEditingController controller;
  String? hintText;
  bool? obscureText;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  bool isBorder;
  double? height;
  double? width;
  bool isVisible;
  bool isEdit;
  bool isReadOnly;

  Color borderColor;
  Color hintColor;
  bool isSearch;
  bool isPassword;
  double radius;
  Color fillColor;
  int inputFormatter;
  String? label;
  int iconPadding;

  Widget? suffixIcon;
  bool isPrefixIcon;

  bool? isSearchTap;
  VoidCallback? onTap;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? label!.to12W400Text(color: whitePrimary)
            : const SizedBox(),
        label != null ? 2.height : const SizedBox(),
        SizedBox(
          height: height,
          width: width,
          child: TextFormField(
              readOnly: isReadOnly,
              autofocus: false,
              controller: controller,
              autovalidateMode: controller.text.isNotEmpty
                  ? AutovalidateMode.always
                  : AutovalidateMode.onUserInteraction,
              style: TextStyle(
                  fontSize: 14, fontWeight: w400, color: whitePrimary),
              obscureText: obscureText ?? false,
              keyboardType: textInputType,
              validator: validator,
              onChanged: onChanged,
              onFieldSubmitted: onSubmitted,
              textInputAction: textInputAction,
              onTap: onTap,
              inputFormatters: [
                LengthLimitingTextInputFormatter(inputFormatter)
              ],
              onTapOutside: (event) {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              decoration: InputDecoration(
                errorStyle: TextStyle(
                  fontSize: 12,
                  color: redSecondary,
                  fontWeight: w400,
                ),
                fillColor: fillColor,
                filled: isBorder == true ? true : false,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: hintText,
                errorMaxLines: 2,
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: hintColor,
                  fontWeight: w400,
                ),
                contentPadding: isBorder == true
                    ? EdgeInsets.symmetric(
                        vertical: 10.h,
                      )
                    : null,
                suffixIcon: suffixIcon ?? const SizedBox(),
                prefixText: isPrefixIcon ? "+1 " : null,
                prefixStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: w400,
                    color: whitePrimary),
                border: isBorder == true
                    ? OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor, width: 1),
                      )
                    : InputBorder.none,
                errorBorder: isBorder == true
                    ? const OutlineInputBorder(
                        borderSide: BorderSide(color: redSecondary, width: 1),
                      )
                    : InputBorder.none,
                focusedErrorBorder: isBorder == true
                    ? const OutlineInputBorder(
                        borderSide: BorderSide(color: redSecondary, width: 1.2),
                      )
                    : InputBorder.none,
                enabledBorder: isBorder == true
                    ? OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor, width: 1),
                      )
                    : InputBorder.none,
                focusedBorder: isBorder == true
                    ? const OutlineInputBorder(
                        borderSide: BorderSide(color: azurePrimary, width: 1),
                      )
                    : InputBorder.none,
              )),
        ),
      ],
    );
  }
}

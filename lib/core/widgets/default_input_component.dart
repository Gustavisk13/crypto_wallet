// ignore_for_file: prefer_const_constructors

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:crypto_wallet/core/utils/styles.dart';

class DefaultInputComponent extends StatelessWidget {
  final String? label;
  final String? errorText;
  final String? initialValue;
  final String? prefixText;
  final int? maxLength;
  final Function? onSaved;
  final Function? validator;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool? obscureText;
  final bool? enable;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatter;
  final TextEditingController? controller;
  final bool? readOnly;
  final bool? autofocus;
  final InputDecoration? decoration;
  final bool? validated;
  final FocusNode? focusNode;
  final Function? iconOnTap;
  final Color? suffixIconColor;
  final bool? enableSuffixIcon;
  final int? minLines;

  const DefaultInputComponent({
    Key? key,
    this.label,
    this.initialValue,
    this.maxLength,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.enable,
    this.textInputAction,
    this.keyboardType,
    this.maxLines,
    this.inputFormatter,
    this.controller,
    this.readOnly,
    this.autofocus,
    this.decoration,
    this.prefixText,
    this.errorText,
    this.focusNode,
    this.iconOnTap,
    this.suffixIconColor,
    this.minLines,
    required this.enableSuffixIcon,
    required this.validated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        controller: controller,
        inputFormatters: inputFormatter,
        maxLines: maxLines ?? 1,
        enabled: enable ?? true,
        initialValue: initialValue,
        readOnly: readOnly ?? false,
        obscureText: obscureText ?? false,
        maxLength: maxLength,
        textInputAction: textInputAction ?? TextInputAction.next,
        onFieldSubmitted: (value) => {
              if (onFieldSubmitted != null) {onFieldSubmitted!(value)}
            },
        onChanged: (value) => {
              if (onChanged != null) {onChanged!(value)}
            },
        onSaved: (value) => {
              if (onSaved != null) {onSaved!(value)}
            },
        validator: (value) {
          if (validator != null) {
            return validator!(value);
          }
          return null;
        },
        keyboardType: keyboardType,
        style: GoogleFonts.montserrat(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
        minLines: minLines,
        decoration: InputDecoration(
          errorText: validated! ? null : errorText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
          filled: true,
          fillColor: baseColor2,
          labelStyle: const TextStyle(color: Colors.white, fontSize: 18),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
          labelText: label ?? '',
          suffixIcon: enableSuffixIcon!
              ? IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    suffixIcon?.icon,
                    color: suffixIconColor ?? Colors.grey,
                  ),
                  onPressed: () => {
                    if (iconOnTap != null) {iconOnTap!()}
                  },
                )
              : null,
        ));
  }
}

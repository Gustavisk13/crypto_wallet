// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

class DefaultTitleComponent extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;

  const DefaultTitleComponent(
      {Key? key,
      required this.title,
      this.color,
      this.fontSize,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: GoogleFonts.montserrat(
          color: color ?? Colors.white,
          fontSize: fontSize ?? 24,
          fontWeight: FontWeight.w700),
      textAlign: textAlign,
    );
  }
}

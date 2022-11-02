import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTitleComponent extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? fontSize;

  const DefaultTitleComponent({Key? key, required this.title, this.color, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title!,
        style: GoogleFonts.montserrat(color: color ?? Colors.white, fontSize: fontSize ?? 24, fontWeight: FontWeight.w700));
  }
}

import 'package:crypto_wallet/global/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalTheme {
  static ThemeData getTheme(BuildContext context) {
    return ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      primarySwatch: Colors.blue,
      primaryColor: primaryColor,
    );
  }
}

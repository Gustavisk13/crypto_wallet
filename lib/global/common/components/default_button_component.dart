import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../src/utils/styles.dart';

class DefaultButtonComponent extends StatelessWidget {
  final bool? autofocus;
  final Widget? child;
  final Clip? clipBehavior;
  final bool? enabled;
  final Function? onFocusChange;
  final Function? onHover;
  final Function? onLongPress;
  final Function? onPressed;

  DefaultButtonComponent({
    Key? key,
    this.autofocus,
    this.clipBehavior,
    this.enabled,
    this.onFocusChange,
    this.onHover,
    this.onLongPress,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        if (onPressed != null) {onPressed!()}
      },
      onFocusChange: (value) => {
        if (onFocusChange != null) {onFocusChange!(value)}
      },
      onLongPress: () => {
        if (onLongPress != null) {onLongPress!()}
      },
      onHover: (value) => {
        if (onHover != null) {onHover!(value)}
      },
      autofocus: autofocus ?? false,
      clipBehavior: clipBehavior ?? Clip.none,
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        textStyle: GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.w600),
        foregroundColor: Color(Colors.black.value),
      ),
      child: child,
    );
  }
}

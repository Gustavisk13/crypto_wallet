import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/styles.dart';

class DefaultButtonComponent extends StatelessWidget {
  final bool? autofocus;
  final Widget? child;
  final Clip? clipBehavior;
  final bool? enabled;
  final Function? onFocusChange;
  final Function? onHover;
  final Function? onLongPress;
  final Function? onPressed;
  final Color? primary;
  final Color? secondary;
  final bool? toggleBorders;
  final double? borderWidth;

  DefaultButtonComponent({
    Key? key,
    this.autofocus,
    this.clipBehavior,
    this.enabled,
    this.onFocusChange,
    this.onHover,
    this.onLongPress,
    this.primary,
    this.secondary,
    this.borderWidth,
    required this.toggleBorders,
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
        backgroundColor: primary ?? secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: toggleBorders!
              ? BorderSide(color: secondary ?? secondaryColor, width: borderWidth ?? 1)
              : BorderSide(color: Colors.transparent),
        ),
        textStyle: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w600),
        foregroundColor: Color(Colors.black.value),
      ),
      child: child,
    );
  }
}

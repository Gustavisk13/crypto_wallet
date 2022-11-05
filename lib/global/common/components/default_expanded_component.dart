// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:crypto_wallet/global/utils/styles.dart';

class DefaultExpandedComponent extends StatelessWidget {
  final List<Widget>? children;

  const DefaultExpandedComponent({Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        iconColor: secondaryColor,
        collapsedIconColor: secondaryColor,
        shape: const Border(
          bottom: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
        ),
        collapsedShape: const Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.montserrat(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        children: children!);
  }
}

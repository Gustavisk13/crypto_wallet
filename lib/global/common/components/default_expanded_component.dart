// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:crypto_wallet/global/utils/styles.dart';

class DefaultExpandedComponent extends StatelessWidget {
  final Icon? icon;
  final String? title;
  final List<Widget>? children;

  const DefaultExpandedComponent(
      {Key? key, required this.children, this.icon, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTileTheme(
      data: ExpansionTileThemeData(
        iconColor: secondaryColor,
        collapsedIconColor: secondaryColor,
        tilePadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        childrenPadding: const EdgeInsets.only(left: 6),
      ),
      child: ExpansionTile(
          title: Row(
            children: [
              icon ?? const SizedBox(),
              const SizedBox(
                width: 10,
              ),
              Text(
                title ?? '',
                style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
          children: children!),
    );
  }
}

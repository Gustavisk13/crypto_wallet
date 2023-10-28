// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crypto_wallet/core/utils/styles.dart';

// Package imports:

class DefaultCard extends StatelessWidget {
  final Color? secondary;
  final Color? primary;
  final bool? toggleBorders;
  final Widget? child;

  const DefaultCard(
      {Key? key, this.secondary, this.primary, this.toggleBorders, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SizedBox(
      width: media.width,
      height: 160,
      child: Card(
        color: primary ?? baseColor2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: toggleBorders!
              ? BorderSide(color: secondary ?? secondaryColor, width: 2)
              : const BorderSide(color: Colors.transparent),
        ),
        child: child,
      ),
    );
  }
}

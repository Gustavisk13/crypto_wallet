import 'package:crypto_wallet/global/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DefaultCard extends StatelessWidget {
  final Color? secondary;
  final Color? primary;
  final bool? toggleBorders;
  final Widget? child;

  const DefaultCard({Key? key, this.secondary, this.primary, this.toggleBorders, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 1.25,
      height: 160,
      child: Card(
        color: primary ?? baseColor2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: toggleBorders! ? BorderSide(color: secondary ?? secondaryColor, width: 2) : BorderSide(color: Colors.transparent),
        ),
        child: child,
      ),
    );
  }
}

// Flutter imports:
import 'package:flutter/material.dart';

class LoadingComponent extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;

  const LoadingComponent({Key? key, this.height, this.width, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 20,
      width: width ?? 20,
      child: CircularProgressIndicator(
        color: color ?? Colors.black,
      ),
    );
  }
}

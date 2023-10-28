// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crypto_wallet/core/utils/styles.dart';

class DefaultSwitch extends StatelessWidget {
  final bool value;
  final Function? onChanged;

  const DefaultSwitch({Key? key, required this.value, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      activeColor: secondaryColor,
      inactiveTrackColor: secondaryColor.withOpacity(0.45),
      activeTrackColor: secondaryColor.withOpacity(0.45),
    );
  }
}

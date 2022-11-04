import 'package:crypto_wallet/global/common/components/default_button_component.dart';
import 'package:crypto_wallet/global/common/components/default_title_component.dart';
import 'package:crypto_wallet/global/utils/styles.dart';
import 'package:crypto_wallet/modules/root/controllers/root_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultDialog extends StatelessWidget {
  //TODO - Convert to a generic dialog component with parameters for title, content, buttons, etc.
  const DefaultDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RootController rootController = Get.find<RootController>();
    return AlertDialog(
      backgroundColor: baseColor2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: secondaryColor, width: 2),
      ),
      title: const DefaultTitleComponent(
        title: 'Exit',
        textAlign: TextAlign.center,
      ),
      content: Container(
        child: Text(
          'Are you sure you want to exit?',
          style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(bottom: 10),
      actions: [
        DefaultButtonComponent(
            toggleBorders: true,
            onPressed: () {
              SystemNavigator.pop();
            },
            child: const Text(
              'Yes',
            )),
        const SizedBox(width: 10),
        DefaultButtonComponent(
            toggleBorders: true,
            onPressed: () {
              Get.back();
            },
            child: const Text('No')),
      ],
    );
  }
}

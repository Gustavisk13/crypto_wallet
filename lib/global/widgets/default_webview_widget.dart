// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Project imports:
import 'package:crypto_wallet/global/common/components/default_title_component.dart';
import 'package:crypto_wallet/global/utils/snackbar_hancdler.dart';
import 'package:crypto_wallet/global/utils/styles.dart';

class DefaultWebView extends StatelessWidget {
  final String url;
  final String? title;

  const DefaultWebView({Key? key, required this.url, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: DefaultTitleComponent(
            title: title ?? 'Crypto Wallet',
            textAlign: TextAlign.center,
          ),
          backgroundColor: baseColor2,
          shape: Border(
            bottom: BorderSide(
              color: secondaryColor,
              width: 2,
            ),
          ),
          iconTheme: IconThemeData(
            color: secondaryColor,
          ),
        ),
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebResourceError: (error) {
            Get.back();
            Get.showSnackbar(
                SnackbarHandler.showSnackbarError(error.description));
          },
        ),
      ),
    );
  }
}

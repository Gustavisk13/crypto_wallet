// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:crypto_wallet/global/common/components/default_expanded_component.dart';
import 'package:crypto_wallet/global/common/components/default_title_component.dart';
import 'package:crypto_wallet/global/utils/image_routes.dart';
import 'package:crypto_wallet/global/utils/styles.dart';
import 'package:crypto_wallet/global/widgets/default_switch.dart';
import 'package:crypto_wallet/global/widgets/default_webview_widget.dart';
import 'package:crypto_wallet/modules/profile/contact_form_view.dart';
import 'package:crypto_wallet/modules/profile/controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Obx(
      () => SafeArea(
          child: Container(
        padding: const EdgeInsets.all(16),
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 100,
                width: 100,
                child: Image(image: AssetImage(ImageRoutes.profileEffigy)),
              ),
              const SizedBox(
                height: 15,
              ),
              const DefaultTitleComponent(title: '\${name}'),
              const SizedBox(
                height: 15,
              ),
              const DefaultTitleComponent(title: '\${email}'),
              const SizedBox(
                height: 30,
              ),
              DefaultExpandedComponent(
                  title: 'Notifications',
                  icon: const Icon(Icons.notifications_none),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Deseja receber notificações?',
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        DefaultSwitch(
                            value:
                                profileController.notificationSwitchValue.value,
                            onChanged: (value) {
                              profileController.notificationSwitchValue.value =
                                  value;
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Deseja receber e-mails?',
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        DefaultSwitch(
                            value: profileController.emailSwitchValue.value,
                            onChanged: (value) {
                              profileController.emailSwitchValue.value = value;
                            })
                      ],
                    )
                  ]),
              DefaultExpandedComponent(
                  title: 'Help and Support',
                  icon: const Icon(Icons.help_outline),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('FAQ',
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        IconButton(
                            onPressed: () {
                              Get.to(
                                  () => const DefaultWebView(
                                      title: 'FAQ',
                                      url:
                                          'https://www.loremipzum.com/pt/perguntas-frequentes'),
                                  transition: Transition.rightToLeft);
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: secondaryColor,
                              size: 18,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Política de Privacidade',
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        IconButton(
                            onPressed: () {
                              Get.to(
                                  const DefaultWebView(
                                      title: 'Política de Privacidade',
                                      url:
                                          'https://loremipsum.io/privacy-policy/'),
                                  transition: Transition.rightToLeft);
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: secondaryColor,
                              size: 18,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Contato',
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        IconButton(
                            onPressed: () {
                              Get.to(() => const ContactFormView(),
                                  transition: Transition.rightToLeft);
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: secondaryColor,
                              size: 18,
                            ))
                      ],
                    )
                  ]),
              DefaultExpandedComponent(
                  title: 'Terms and Conditions',
                  icon: const Icon(Icons.assignment_outlined),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('EULA',
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        IconButton(
                            onPressed: () {
                              Get.toNamed('/eula');
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: secondaryColor,
                              size: 18,
                            ))
                      ],
                    )
                  ]),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.exit_to_app_outlined,
                      color: Colors.red,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Logout',
                      style: GoogleFonts.montserrat(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

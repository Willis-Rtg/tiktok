import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/username_screen.dart';
import 'package:tiktok/features/authentication/login_screen.dart';
import 'package:tiktok/features/authentication/widgets/auth_button.dart';
import 'package:tiktok/generated/l10n.dart';
import 'package:tiktok/utils.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/";
  const SignUpScreen({super.key});

  void onLoginTap(BuildContext context) async {
    // await Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const LoginScreen(),
    //   ),
    // );
    context.push(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
              child: Column(
                children: [
                  Gaps.v64,
                  Text(
                    S.of(context).signUpTitle("TikTok", DateTime.now()),
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Gaps.v12,
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      S.of(context).signUpSubtitle(121),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Gaps.v52,
                  if (orientation == Orientation.portrait) ...[
                    AuthButton(
                      icon: const FaIcon(FontAwesomeIcons.user),
                      text: S.of(context).emailPhoneButton,
                      onTapPage: const UsernameScreen(),
                    ),
                    AuthButton(
                        icon: const FaIcon(FontAwesomeIcons.facebook),
                        text: S.of(context).facebookButton),
                    AuthButton(
                        icon: const FaIcon(FontAwesomeIcons.apple),
                        text: S.of(context).appleButton),
                    AuthButton(
                        icon: const FaIcon(FontAwesomeIcons.google),
                        text: S.of(context).googleButton),
                  ],
                  if (orientation == Orientation.landscape)
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4,
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 60,
                          mainAxisSpacing: 1,
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 10,
                        ),
                        children: [
                          AuthButton(
                            icon: const FaIcon(FontAwesomeIcons.user),
                            text: S.of(context).emailPhoneButton,
                            onTapPage: const UsernameScreen(),
                          ),
                          AuthButton(
                              icon: const FaIcon(FontAwesomeIcons.facebook),
                              text: S.of(context).facebookButton),
                          AuthButton(
                              icon: const FaIcon(FontAwesomeIcons.apple),
                              text: S.of(context).appleButton),
                          AuthButton(
                              icon: const FaIcon(FontAwesomeIcons.google),
                              text: S.of(context).googleButton),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: isDarkMode(context) ? null : Colors.grey.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).alreadyHaveAnAccount,
                  style: const TextStyle(fontSize: Sizes.size14),
                ),
                GestureDetector(
                  onTap: () => onLoginTap(context),
                  child: Text(
                    S.of(context).login("female"),
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: Sizes.size14,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

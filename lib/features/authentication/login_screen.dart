import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/login_form_screen.dart';
import 'package:tiktok/features/authentication/widgets/auth_button.dart';
import 'package:tiktok/utils.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  const LoginScreen({super.key});

  void onSignUpTap(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
          child: Column(
            children: [
              Gaps.v64,
              Text(
                "Log in to TikTok",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              Gaps.v12,
              Opacity(
                opacity: 0.7,
                child: Text(
                  "Manage your account, check notifications, comment on videos, and more.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Gaps.v52,
              const AuthButton(
                icon: FaIcon(FontAwesomeIcons.user),
                text: "Use phone or email",
                onTapPage: LoginFormScreen(),
              ),
              // AuthButton(
              //     icon: FaIcon(FontAwesomeIcons.facebook),
              //     text: "Continue with Facebook"),
              // AuthButton(
              //     icon: FaIcon(FontAwesomeIcons.apple),
              //     text: "Continue with Apple"),
              // AuthButton(
              //     icon: FaIcon(FontAwesomeIcons.google),
              //     text: "Continue with Google"),
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
            const Text(
              "Don't have an account? ",
              style: TextStyle(fontSize: Sizes.size14),
            ),
            GestureDetector(
              onTap: () => onSignUpTap(context),
              child: Text(
                "Sign up",
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
  }
}

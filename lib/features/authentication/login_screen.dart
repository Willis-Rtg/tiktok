import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/login_form_screen.dart';
import 'package:tiktok/features/authentication/widgets/auth_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size32),
          child: Column(
            children: [
              Gaps.v64,
              Text(
                "Log in to TikTok",
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w700),
              ),
              Gaps.v12,
              Text(
                "Manage your account, check notifications, comment on videos, and more.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.size14,
                  color: Colors.black54,
                ),
              ),
              Gaps.v52,
              AuthButton(
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
        color: Colors.grey.shade50,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size28),
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
      ),
    );
  }
}

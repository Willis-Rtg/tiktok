import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/birthday_screen.dart';
import 'package:tiktok/features/authentication/password_screen.dart';
import 'package:tiktok/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid1() {
    return _password.isNotEmpty &&
        _password.length >= 8 &&
        _password.length <= 20;
  }

  bool _isPasswordValid2() {
    final regExp = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]");

    return regExp.hasMatch(_password);
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_isPasswordValid1() && _isPasswordValid2()) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const BirthdayScreen()));
    }
  }

  void onClearTap() {
    _passwordController.clear();
  }

  bool _obscureText = true;

  void onObscureTap() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign up"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size24,
            horizontal: Sizes.size32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v28,
              TextField(
                controller: _passwordController,
                autocorrect: false,
                cursorColor: Theme.of(context).primaryColor,
                onEditingComplete: _onSubmit,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: "password",
                  // errorText: _isPasswordValid(),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h16,
                      GestureDetector(
                        onTap: onObscureTap,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      )
                    ],
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
              Gaps.v10,
              const Text(
                "Your password must have:",
                style: TextStyle(
                    fontSize: Sizes.size12, fontWeight: FontWeight.w700),
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size16,
                    color: _isPasswordValid1()
                        ? Colors.green
                        : Colors.grey.shade400,
                  ),
                  Gaps.h6,
                  const Text(
                    "8 to 20 characters",
                    style: TextStyle(fontSize: Sizes.size12),
                  )
                ],
              ),
              Gaps.v5,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size16,
                    color: _isPasswordValid2()
                        ? Colors.green
                        : Colors.grey.shade400,
                  ),
                  Gaps.h6,
                  const Text(
                    "Letters, numbers, and special characters",
                    style: TextStyle(fontSize: Sizes.size12),
                  )
                ],
              ),
              Gaps.v28,
              FormButton(
                disabled: !_isPasswordValid1() || !_isPasswordValid2(),
                nextPage: const BirthdayScreen(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

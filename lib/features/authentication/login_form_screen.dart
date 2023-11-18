import 'package:flutter/material.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/widgets/form_button.dart';
import 'package:tiktok/features/authentication/widgets/unfocus_widget.dart';
import 'package:tiktok/features/onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};
  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState?.save();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const InterestsScreen(),
          ),
          (route) {
            return false;
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return UnfocusWidget(
      child: Scaffold(
        appBar: AppBar(title: const Text("Log in")),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gaps.v28,
                TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Please write your email";
                    }
                    return null;
                  },
                  onSaved: (newValue) => {
                    if (newValue != null) formData["email"] = newValue,
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                Gaps.v8,
                TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  obscureText: true,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Please write your password";
                    }
                    return null;
                  },
                  onSaved: (newValue) => {
                    if (newValue != null) formData["password"] = newValue,
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                Gaps.v24,
                FormButton(
                  disabled: false,
                  text: "Log in",
                  onTapfn: _onSubmitTap,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/email_screen.dart';
import 'package:tiktok/features/authentication/widgets/form_button.dart';

class UsernameScreen extends StatefulWidget {
  static String routeName = "/username";
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = "";

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_username.isEmpty) return;
    context.push(
      EmailScreen.routeName,
      extra: EmailScreenArgs(username: _username),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Create username",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v8,
            const Opacity(
              opacity: 0.7,
              child: Text(
                "You can always change this later.",
                style: TextStyle(
                  fontSize: Sizes.size14,
                ),
              ),
            ),
            Gaps.v28,
            TextField(
              controller: _usernameController,
              cursorColor: Theme.of(context).primaryColor,
              onSubmitted: (value) => _onSubmit(),
              decoration: InputDecoration(
                hintText: "Username",
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
            Gaps.v20,
            FormButton(
              disabled: _username.isEmpty,
              nextPage: EmailScreen(
                username: _username,
              ),
            )
          ],
        ),
      ),
    );
  }
}

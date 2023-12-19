import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/email_screen.dart';
import 'package:tiktok/features/authentication/widgets/form_button.dart';
import 'package:tiktok/features/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  late DateTime initialDate;

  @override
  void initState() {
    super.initState();
    final DateTime now = DateTime.now();
    initialDate = DateTime(now.year - 12);
    _setTextFieldDate(initialDate);
    setState(() {});
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmailScreen(
          username: "",
        ),
      ),
    );
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.text = textDate;
  }

  void _onBtnTap() {
    context.push(const InterestsScreen().routeName);
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
              "When's your birthday?",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v8,
            const Text(
              "Your birthday won't be shown publicly.",
              style: TextStyle(
                color: Colors.black54,
                fontSize: Sizes.size14,
              ),
            ),
            Gaps.v28,
            TextField(
              enabled: true,
              controller: _birthdayController,
              cursorColor: Theme.of(context).primaryColor,
              onSubmitted: (value) => _onSubmit(),
              decoration: InputDecoration(
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
              disabled: false,
              // nextPage: EmailScreen(),
              onTapfn: _onBtnTap,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 220,
        child: SizedBox(
          child: CupertinoDatePicker(
            maximumDate: initialDate,
            initialDateTime: initialDate,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: _setTextFieldDate,
          ),
        ),
      ),
    );
  }
}

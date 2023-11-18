import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onTapPage});

  final String text;
  final FaIcon icon;
  final Widget onTapPage;

  void _onButtonTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => onTapPage));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onButtonTap(context),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          margin: const EdgeInsets.only(bottom: Sizes.size10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: Sizes.size1),
          ),
          padding: const EdgeInsets.symmetric(
              vertical: Sizes.size11, horizontal: Sizes.size20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(alignment: Alignment.centerLeft, child: icon),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: Sizes.size14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

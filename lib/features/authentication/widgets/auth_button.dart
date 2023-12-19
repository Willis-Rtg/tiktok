import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/username_screen.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTapPage,
  });

  final String text;
  final FaIcon icon;
  final Widget? onTapPage;

  void _onButtonTap(BuildContext context) {
    if (onTapPage != null) {
      // Navigator.of(context).push(
      //   PageRouteBuilder(
      //     transitionDuration: const Duration(milliseconds: 500),
      //     reverseTransitionDuration: const Duration(milliseconds: 500),
      //     transitionsBuilder: (context, animation, animation2, child) {
      //       final slideAnimation =
      //           Tween(begin: const Offset(1, 0), end: const Offset(0, 0))
      //               .animate(animation);
      //       final fadeAnimation =
      //           Tween(begin: 0.5, end: 1.0).animate(animation);
      //       return SlideTransition(
      //         position: slideAnimation,
      //         child: FadeTransition(
      //           opacity: fadeAnimation,
      //           child: child,
      //         ),
      //       );
      //     },
      //     pageBuilder: (context, animation, animation2) {
      //       return onTapPage!;
      //     },
      //   ),
      // );
      context.push(UsernameScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onButtonTap(context),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: Sizes.size10),
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.grey.shade300, width: Sizes.size1),
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
        ],
      ),
    );
  }
}

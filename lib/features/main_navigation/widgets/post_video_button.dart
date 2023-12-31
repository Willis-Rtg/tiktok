import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/utils.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({
    super.key,
    required this.inverted,
  });

  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 16,
          child: Container(
            height: 35,
            width: 30,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size7,
            ),
            decoration: BoxDecoration(
              color: const Color(0xff61d4f0),
              borderRadius: BorderRadius.circular(Sizes.size10),
            ),
          ),
        ),
        Positioned(
          left: 16,
          child: Container(
            height: 35,
            width: 30,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size7,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(Sizes.size10),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size12, vertical: Sizes.size7),
          decoration: BoxDecoration(
            color: inverted && !isDarkMode(context)
                ? Colors.black87
                : Colors.white,
            borderRadius: BorderRadius.circular(Sizes.size10),
          ),
          child: FaIcon(
            FontAwesomeIcons.plus,
            size: Sizes.size20,
            color:
                inverted && !isDarkMode(context) ? Colors.white : Colors.black,
          ),
        )
      ],
    );
  }
}

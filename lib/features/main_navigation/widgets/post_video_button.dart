import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({
    super.key,
  });

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
            color: Colors.white,
            borderRadius: BorderRadius.circular(Sizes.size10),
          ),
          child: const FaIcon(
            FontAwesomeIcons.plus,
            size: Sizes.size20,
          ),
        )
      ],
    );
  }
}

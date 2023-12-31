import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/main_navigation/main_navigation_screen.dart';
import 'package:tiktok/utils.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      _direction = Direction.right;
    } else {
      _direction = Direction.left;
    }
    setState(() {});
  }

  void _onPanEnd(DragEndDetails detail) {
    if (_direction == Direction.left) {
      _showingPage = Page.second;
    } else {
      _showingPage = Page.first;
    }
    setState(() {});
  }

  void _onEnterAppTap() {
    context.push(const MainNavigationScreen().routeName);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 400),
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v28,
                  Text(
                    "Swipe up",
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v10,
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    ),
                  ),
                ],
              ),
              secondChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v28,
                  Text(
                    "Follow the rules",
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v10,
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: isDarkMode(context) ? Colors.black : Colors.white,
          elevation: 0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: _showingPage == Page.first ? 0 : 1,
            child: CupertinoButton(
              color: Theme.of(context).primaryColor,
              onPressed: _onEnterAppTap,
              child: const Text(
                "Next",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

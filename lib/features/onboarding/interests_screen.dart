import 'package:flutter/material.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/widgets/form_button.dart';
import 'package:tiktok/features/onboarding/tutorial_screen.dart';
import 'package:tiktok/features/onboarding/widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  void onScroll() {
    if (_scrollController.offset > 60) {
      if (_showTitle) return;
      _showTitle = true;
    } else {
      _showTitle = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: _showTitle ? 1 : 0,
          child: const Text("Choose your interests"),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.only(
                left: Sizes.size28, right: Sizes.size28, bottom: Sizes.size10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Choose your interests",
                  style: TextStyle(
                    fontSize: Sizes.size36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v16,
                const Text(
                  "Get better video recommendations",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gaps.v28,
                Wrap(
                  runSpacing: Sizes.size16,
                  spacing: Sizes.size16,
                  children: [
                    for (var interest in interests)
                      InterestButton(interest: interest)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
          padding: EdgeInsets.symmetric(
              vertical: Sizes.size14, horizontal: Sizes.size16),
          child: FormButton(
            disabled: false,
            text: "Next",
            nextPage: TutorialScreen(),
          )),
    );
  }
}

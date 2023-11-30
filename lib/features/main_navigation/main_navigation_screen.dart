import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/features/discover/discover_screen.dart';
import 'package:tiktok/features/inbox/inbox_screen.dart';
import 'package:tiktok/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok/features/user/user_profile_screen.dart';
import 'package:tiktok/features/video/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final screens = [
    const VideoTimelineScreen(),
    const Center(
      child: DiscoverScreen(),
    ),
    const Center(
      child: Text("Plus"),
    ),
    const Center(
      child: InboxScreen(),
    ),
    const Center(
      child: UserProfileScreen(),
    ),
  ];

  int _selectedIndex = 4;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Record Video"),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedIndex == 0 ? Colors.black : Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: screens[_selectedIndex],
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: screens[_selectedIndex],
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: screens[_selectedIndex],
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: screens[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectedIndex == 0 ? Colors.black : Colors.white,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavTab(
              icon: FontAwesomeIcons.house,
              text: "Home",
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
              darkMode: _selectedIndex == 0,
            ),
            NavTab(
              icon: FontAwesomeIcons.magnifyingGlass,
              text: "Discover",
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
              darkMode: _selectedIndex == 0,
            ),
            Gaps.h24,
            GestureDetector(
              onTap: _onPostVideoButtonTap,
              child: PostVideoButton(inverted: _selectedIndex != 0),
            ),
            Gaps.h24,
            NavTab(
              icon: FontAwesomeIcons.message,
              text: "Inbox",
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
              darkMode: _selectedIndex == 0,
            ),
            NavTab(
              icon: FontAwesomeIcons.user,
              text: "Profile",
              isSelected: _selectedIndex == 4,
              onTap: () => _onTap(4),
              darkMode: _selectedIndex == 0,
            ),
          ],
        ),
      ),
    );
  }
}

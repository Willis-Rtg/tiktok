import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/inbox/activity_screen.dart';
import 'package:tiktok/features/inbox/chats_screen.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onDMTap() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ChatsScreen(),
        ),
      );
    }

    void onActivityTap(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ActivityScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black26,
        title: const Text("Inbox"),
        actions: [
          IconButton(
            onPressed: onDMTap,
            icon: const FaIcon(FontAwesomeIcons.message),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => onActivityTap(context),
            title: const Text(
              "Activity",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size14,
            ),
          ),
          Container(
            color: Colors.grey.shade100,
            height: Sizes.size1,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
              vertical: Sizes.size16,
            ),
            child: const Text(
              "Messages",
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: Sizes.size16),
            ),
          ),
          ListTile(
            leading: Container(
              width: Sizes.size52,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.users,
                  color: Colors.white,
                ),
              ),
            ),
            title: const Text(
              "New followers",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              "Messages from followers will appear here",
              style: TextStyle(
                fontSize: Sizes.size12,
                color: Colors.grey.shade500,
              ),
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size14,
            ),
          ),
          Container(
            color: Colors.grey.shade100,
            height: Sizes.size1,
          ),
        ],
      ),
    );
  }
}

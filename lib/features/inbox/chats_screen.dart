import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/sizes.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  // add item at last
  final List<int> _items = [];

  void _onPlusTap() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(0);
      _items.add(_items.length);
    }
  }

  void _onChatLongPress(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Direct messages"),
        actions: [
          IconButton(
            highlightColor: Colors.transparent,
            onPressed: _onPlusTap,
            icon: const FaIcon(FontAwesomeIcons.plus),
          ),
        ],
      ),
      body: Stack(
        children: [
          AnimatedList(
            key: _key,
            itemBuilder: (context, index, animation) => SizeTransition(
              sizeFactor: animation,
              child: FadeTransition(
                key: UniqueKey(),
                opacity: animation,
                child: GestureDetector(
                  onLongPress: () => _onChatLongPress(index),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 34,
                          backgroundImage: NetworkImage(
                              "https://d1telmomo28umc.cloudfront.net/media/public/avatars/wills-1636619076.jpg"),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: Sizes.size10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "AntonioBM $index",
                                      style: const TextStyle(
                                          fontSize: Sizes.size16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "2:16 PM",
                                      style: TextStyle(
                                          color: Colors.grey.shade500),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Say hi to AntonioBM",
                                  style: TextStyle(
                                      fontSize: Sizes.size14,
                                      color: Colors.grey.shade500),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

 /*ListT ile(
            minVerticalPadding: Sizes.size10,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            leading: const CircleAvatar(
              radius: Sizes.size28,
              backgroundImage: NetworkImage(
                  "https://d1telmomo28umc.cloudfront.net/media/public/avatars/wills-1636619076.jpg"),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Andrew",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "2:16 PM",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    color: Colors.grey.shade500,
                  ),
                )
              ],
            ),
            subtitle: Text(
              "Hello, my students",
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ), */
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/inbox/chat_detail_screen.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  // add item at last
  final List<int> _items = [];

  void _onPlusTap() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(0);
      _items.add(_items.length);
    }
  }

  final List<String> _chatSettings = [
    "채팅방 이름 설정",
    "즐겨찾기에 추가",
    "채팅방 상단 고정",
    "채팅방 알림 끄기",
    "홈 화면에 바로가기 추가",
    "나가기",
  ];
  bool _showBarrier = false;
  final Map<String, dynamic> _longPressedChat = {};

  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300));
  late final Animation<double> _chatSettingAnimation =
      Tween(begin: 0.0, end: 1.0).animate(_animationController);

  Future<void> _toggleChatSetting(String? chatName, int? index) async {
    if (!_animationController.isCompleted) {
      if (chatName != null) {
        _longPressedChat["chatName"] = chatName;
        _longPressedChat["index"] = index;
      }
      _animationController.forward();
    } else {
      await _animationController.reverse();
    }
    setState(() {
      _showBarrier = !_showBarrier;
    });
  }

  void _onChatSettingTap(String setting) async {
    if (setting == "나가기") {
      await _toggleChatSetting(null, null);
      if (_key.currentState != null) {
        _key.currentState!.removeItem(
          _longPressedChat["index"],
          (context, animation) => SizeTransition(
            sizeFactor: animation,
            child: _makeTile(
              _longPressedChat["index"],
            ),
          ),
        );
      }
    }
  }

  void _onChatTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ChatDetailScreen(),
      ),
    );
  }

  Widget _makeTile(int index) {
    return GestureDetector(
      onTap: _onChatTap,
      onLongPress: () => _toggleChatSetting("AntonioBM $index", index),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "AntonioBM $index",
                          style: const TextStyle(
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "2:16 PM",
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                    Text(
                      "Say hi to AntonioBM",
                      style: TextStyle(
                          fontSize: Sizes.size14, color: Colors.grey.shade500),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                    child: _makeTile(index),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Chat settings modal
        if (_showBarrier)
          FadeTransition(
            opacity: _chatSettingAnimation,
            child: ModalBarrier(
              color: Colors.black26,
              onDismiss: () => _toggleChatSetting(null, null),
            ),
          ),
        if (_showBarrier)
          FadeTransition(
            opacity: _chatSettingAnimation,
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.black),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  padding: const EdgeInsets.all(Sizes.size24),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Sizes.size5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _longPressedChat["chatName"],
                        style: const TextStyle(
                            fontSize: Sizes.size18,
                            fontWeight: FontWeight.w600),
                      ),
                      Gaps.v20,
                      for (var setting in _chatSettings)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            GestureDetector(
                              onTap: () => _onChatSettingTap(setting),
                              child: Text(
                                setting,
                                style: const TextStyle(fontSize: Sizes.size16),
                              ),
                            ),
                            if (_chatSettings.last != setting) Gaps.v20
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ),
          )
      ],
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
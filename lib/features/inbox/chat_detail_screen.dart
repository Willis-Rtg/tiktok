import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/breakpoint.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final List<String> _emojies = [
    "❤️❤️❤️",
    "😂😂😂",
    "👍👍👍",
    "▶️ Share post",
  ];

  ScrollController listViewScrollController = ScrollController();

  void _onBackTap() {
    Navigator.pop(context);
  }

  void _onUnfocus() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final video = MediaQuery.of(context).viewInsets.bottom;
    // if (video > 0) {
    //   listViewScrollController.animateTo(
    //     listViewScrollController.position.maxScrollExtent,
    //     duration: const Duration(milliseconds: 300),
    //     curve: Curves.linear,
    //   );
    // }
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: Breakpoints.sm),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            surfaceTintColor: Colors.grey.shade50,
            title: Row(
              children: [
                GestureDetector(
                  onTap: _onBackTap,
                  child: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    size: Sizes.size18,
                  ),
                ),
                Gaps.h16,
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: Sizes.size24,
                      backgroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/45223148?v=4"),
                      child: Center(child: Text("성환")),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: Sizes.size16,
                        height: Sizes.size16,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: Sizes.size3,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Gaps.h10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "xxxxxmmmm967",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: Sizes.size16),
                    ),
                    Text(
                      "Active now",
                      style: TextStyle(
                          fontSize: Sizes.size12,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FaIcon(FontAwesomeIcons.flag),
                      Gaps.h20,
                      FaIcon(FontAwesomeIcons.ellipsis),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: Stack(
            children: [
              GestureDetector(
                onTap: _onUnfocus,
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom == 0
                          ? 130
                          : 100),
                  color: Colors.grey.shade50,
                  child: ListView.separated(
                    controller: listViewScrollController,
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size10,
                      vertical: Sizes.size10,
                    ),
                    itemBuilder: (context, index) {
                      final bool isMine = index % 2 == 0;
                      return Row(
                        mainAxisAlignment: isMine
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Sizes.size14,
                                vertical: Sizes.size10),
                            decoration: BoxDecoration(
                                color: isMine
                                    ? Colors.blue
                                    : Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(Sizes.size10),
                                  topRight: const Radius.circular(Sizes.size10),
                                  bottomRight: isMine
                                      ? const Radius.circular(Sizes.size2)
                                      : const Radius.circular(Sizes.size10),
                                  bottomLeft: !isMine
                                      ? const Radius.circular(Sizes.size2)
                                      : const Radius.circular(Sizes.size10),
                                )),
                            child: const Text(
                              "I am a message.",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Gaps.v10,
                    itemCount: 20,
                  ),
                ),
              ),
              Positioned(
                width:
                    Breakpoints.sm < size.width ? Breakpoints.sm : size.width,
                bottom: 0,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var emoji in _emojies)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size5,
                                horizontal: Sizes.size10,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius:
                                      BorderRadius.circular(Sizes.size16)),
                              child: Text(
                                emoji,
                                style: TextStyle(
                                  fontSize: emoji == _emojies.last
                                      ? Sizes.size14
                                      : Sizes.size16,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    BottomAppBar(
                      height: 50,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: Sizes.size10,
                      ),
                      // color: Colors.transparent,
                      child: Row(
                        children: [
                          const Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Send a message...",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(Sizes.size16),
                                      topRight: Radius.circular(Sizes.size16),
                                      bottomLeft: Radius.circular(Sizes.size16),
                                      bottomRight: Radius.circular(Sizes.size1),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: Sizes.size12,
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.faceGrin),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gaps.h10,
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(right: Sizes.size4),
                              child: const FaIcon(
                                FontAwesomeIcons.paperPlane,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

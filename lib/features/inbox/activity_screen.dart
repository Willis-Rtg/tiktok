import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/breakpoint.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/utils.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  final List<String> notifications = List.generate(20, (index) => "${index}h");
  final List<Map<String, dynamic>> _tabs = [
    {
      "title": "All activity",
      "icon": FontAwesomeIcons.solidMessage,
    },
    {
      "title": "Likes",
      "icon": FontAwesomeIcons.solidHeart,
    },
    {
      "title": "Comments",
      "icon": FontAwesomeIcons.solidCommentDots,
    },
    {
      "title": "Mentions",
      "icon": FontAwesomeIcons.at,
    },
    {
      "title": "Followers",
      "icon": FontAwesomeIcons.solidUser,
    },
    {
      "title": "From TikTok",
      "icon": FontAwesomeIcons.tiktok,
    }
  ];

  bool _showBarrier = false;

  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 200));

  late final Animation<double> _arrowAnimation =
      Tween(begin: 0.0, end: -0.5).animate(_animationController);

  late final Animation<Offset> _panelAnimation =
      Tween(begin: const Offset(0, -1), end: const Offset(0, 0))
          .animate(_animationController);
  late final Animation<Color?> _barrierAnimation =
      ColorTween(begin: Colors.transparent, end: Colors.black38)
          .animate(_animationController);

  void _onDismissed(DismissDirection direction, String notification) {
    notifications.remove(notification);
    setState(() {});
  }

  void _onToggleTabTap() async {
    if (_animationController.isCompleted) {
      await _animationController.reverse();
    } else {
      _animationController.forward();
    }
    setState(() {
      _showBarrier = !_showBarrier;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: Breakpoints.sm),
        child: Scaffold(
          appBar: AppBar(
            // leadingWidth: 0,
            // automaticallyImplyLeading: false,
            title: GestureDetector(
              onTap: _onToggleTabTap,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("All activity"),
                  Gaps.h2,
                  RotationTransition(
                    turns: _arrowAnimation,
                    child: const FaIcon(
                      FontAwesomeIcons.chevronDown,
                      size: Sizes.size14,
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16,
                    ),
                    child: Text(
                      "New",
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Gaps.v12,
                  for (var notification in notifications)
                    Dismissible(
                      key: Key(notification),
                      onDismissed: (direction) =>
                          _onDismissed(direction, notification),
                      background: Container(
                        color: Colors.green,
                        padding: const EdgeInsets.only(left: Sizes.size10),
                        alignment: Alignment.centerLeft,
                        child: const FaIcon(
                          FontAwesomeIcons.check,
                          color: Colors.white,
                          // size: Sizes.size28,
                        ),
                      ),
                      secondaryBackground: Container(
                        color: Colors.red,
                        padding: const EdgeInsets.only(right: Sizes.size10),
                        alignment: Alignment.centerRight,
                        child: const FaIcon(
                          FontAwesomeIcons.trashCan,
                          color: Colors.white,
                          // size: Sizes.size28,
                        ),
                      ),
                      child: ListTile(
                        minVerticalPadding: Sizes.size16,
                        leading: Container(
                          width: Sizes.size52,
                          decoration: BoxDecoration(
                            color: isDarkMode(context)
                                ? Colors.grey.shade700
                                : null,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: isDarkMode(context)
                                  ? Colors.grey.shade600
                                  : Colors.grey.shade300,
                            ),
                          ),
                          child: const Center(
                            child: FaIcon(
                              FontAwesomeIcons.bell,
                            ),
                          ),
                        ),
                        title: RichText(
                          text: TextSpan(
                            text: "Account updates: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: isDarkMode(context) ? null : Colors.black,
                              // fontSize: Sizes.size16,
                            ),
                            children: [
                              const TextSpan(
                                text: "Upload longer videos",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                  text: " $notification",
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                  )),
                            ],
                          ),
                        ),
                        trailing: FaIcon(
                          FontAwesomeIcons.chevronRight,
                          size: Sizes.size14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    )
                ],
              ),
              if (_showBarrier)
                AnimatedModalBarrier(
                  color: _barrierAnimation,
                  onDismiss: _onToggleTabTap,
                ),
              SlideTransition(
                position: _panelAnimation,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(Sizes.size5),
                      bottomRight: Radius.circular(Sizes.size5),
                    ),
                  ),
                  padding: const EdgeInsets.all(Sizes.size6),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (var tab in _tabs)
                        ListTile(
                          title: Row(
                            children: [
                              FaIcon(
                                tab["icon"],
                                size: Sizes.size16,
                              ),
                              Gaps.h16,
                              Text(
                                "${tab["title"]}",
                                style: const TextStyle(
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

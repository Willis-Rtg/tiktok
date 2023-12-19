import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/breakpoint.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/setting/setting_screen.dart';
import 'package:tiktok/features/user/widgets/persistent_tab_bar.dart';
import 'package:tiktok/utils.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen(
      {super.key, required this.username, required this.tab});

  final String username;
  final String tab;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  List<Map<String, String>> infos = [
    {
      "number": "37",
      "title": "Following",
    },
    {
      "number": "10.5M",
      "title": "Followers",
    },
    {
      "number": "149.3M",
      "title": "Likes",
    },
  ];

  void _onSettingTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        initialIndex: widget.tab == "likes" ? 1 : 0,
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: isDarkMode(context) ? Colors.black : null,
                title: Text(widget.username),
                actions: [
                  IconButton(
                    onPressed: _onSettingTap,
                    icon: const FaIcon(FontAwesomeIcons.gear),
                    iconSize: Sizes.size20,
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: Sizes.size44,
                      foregroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/45223148?v=4"),
                      child: Text("Willis"),
                    ),
                    Gaps.v5,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("@${widget.username}"),
                        Gaps.h4,
                        const FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: Sizes.size12,
                          color: Colors.lightBlue,
                        )
                      ],
                    ),
                    Gaps.v10,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var info in infos)
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${info["number"]}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Sizes.size16,
                                    ),
                                  ),
                                  Text(
                                    "${info["title"]}",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: Sizes.size12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              if (info != infos.last)
                                SizedBox(
                                  height: Sizes.size36,
                                  child: VerticalDivider(
                                    color: Colors.grey.shade100,
                                    width: Sizes.size32,
                                    indent: 7,
                                    endIndent: 7,
                                    thickness: 1,
                                  ),
                                )
                            ],
                          )
                      ],
                    ),
                    Gaps.v14,
                    SizedBox(
                      height: Sizes.size40,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Sizes.size2),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Follow",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Gaps.h5,
                          Container(
                            width: Sizes.size40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            child: const Center(
                              child: FaIcon(FontAwesomeIcons.youtube),
                            ),
                          ),
                          Gaps.h5,
                          Container(
                            width: Sizes.size40,
                            padding: const EdgeInsets.all(Sizes.size8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            child: const Center(
                              child: FaIcon(
                                FontAwesomeIcons.caretDown,
                                size: Sizes.size14,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Gaps.v14,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.size18),
                      child: Column(
                        children: [
                          Text(
                            "All highlights and where to watch live matches on FIFA+",
                            style:
                                TextStyle(fontSize: Sizes.size12 + Sizes.size1),
                            textAlign: TextAlign.center,
                          ),
                          Text("🔽"),
                          Gaps.v4,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.link,
                                size: Sizes.size12,
                              ),
                              Gaps.h4,
                              Text(
                                "https://www.fifa.com/fifaplus/en/home",
                                style: TextStyle(
                                    fontSize: Sizes.size12 + Sizes.size1),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Gaps.v10,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: SizedBox(
            child: TabBarView(
              children: [
                GridView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 20,
                  padding: const EdgeInsets.symmetric(vertical: Sizes.size5),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: size.width > Breakpoints.lg ? 5 : 3,
                      crossAxisSpacing: Sizes.size2,
                      mainAxisSpacing: Sizes.size2,
                      childAspectRatio: 9 / 12),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 9 / 12,
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholderFit: BoxFit.cover,
                              placeholder: "assets/images/placeholder.jpeg",
                              image:
                                  "https://images.unsplash.com/photo-1700639491303-a177c4402501?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            ),
                          ),
                          Positioned(
                            left: 3,
                            top: 3,
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius:
                                          BorderRadius.circular(Sizes.size3)),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.size3,
                                    vertical: Sizes.size1,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Pinned",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: Sizes.size1 + Sizes.size10,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Positioned(
                            bottom: 1,
                            left: 1,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.play_arrow_outlined,
                                  color: Colors.white,
                                  size: Sizes.size20,
                                ),
                                Text(
                                  "4.1M",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.size12,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Text("data"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

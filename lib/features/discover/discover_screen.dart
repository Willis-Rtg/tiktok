import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/breakpoint.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/discover/widgets/search_textfield.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      FocusScope.of(context).unfocus();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.sm,
            ),
            child: const SearchTextfield()),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.sliders))
        ],
        bottom: TabBar(
          tabAlignment: TabAlignment.start,
          controller: _tabController,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0),
          indicatorSize: TabBarIndicatorSize.tab,
          isScrollable: true,
          splashFactory: NoSplash.splashFactory,
          tabs: [
            for (var tab in tabs)
              Tab(
                text: tab,
              )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          GridView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: 20,
            padding: const EdgeInsets.all(Sizes.size10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).size.width > Breakpoints.lg ? 5 : 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size12,
                childAspectRatio: 9 / 20),
            itemBuilder: (context, index) => LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size2),
                      ),
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholderFit: BoxFit.cover,
                          placeholder: "assets/images/placeholder.jpeg",
                          image:
                              "https://images.unsplash.com/photo-1700639491303-a177c4402501?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ),
                      ),
                    ),
                    Gaps.v6,
                    const Opacity(
                      opacity: 0.8,
                      child: Text(
                        "Est aliquip Lorem ad magna minim laboris. Officia magna deserunt do exercitation.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Sizes.size16,
                          height: 1.2,
                        ),
                      ),
                    ),
                    Gaps.v4,
                    if ((constraints.maxWidth > 250 ||
                        constraints.maxWidth < 200))
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 13,
                            foregroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/45223148?v=4"),
                          ),
                          Gaps.h5,
                          Expanded(
                            child: Opacity(
                              opacity: 0.6,
                              child: Text(
                                "Aute magna irure consequat laborum magna veniam tempor do.",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 0.6,
                            child: FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size14,
                            ),
                          ),
                          Gaps.h2,
                          Opacity(
                            opacity: 0.6,
                            child: Text(
                              "2.0M",
                              style: TextStyle(
                                fontSize: Sizes.size12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ],
                      )
                  ],
                );
              },
            ),
          ),
          for (var tab in tabs.skip(1))
            Center(
              child: Text(tab),
            )
        ],
      ),
    );
  }
}

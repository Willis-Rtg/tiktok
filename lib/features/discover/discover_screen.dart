import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        title: const SearchTextfield(),
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
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size12,
                childAspectRatio: 9 / 20),
            itemBuilder: (context, index) => Column(
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
                Gaps.v10,
                const Text(
                  "Est aliquip Lorem ad magna minim laboris. Officia magna deserunt do exercitation.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.size16,
                    color: Colors.black87,
                    height: 1.2,
                  ),
                ),
                Gaps.v4,
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 13,
                      foregroundImage: NetworkImage(
                          "https://d1telmomo28umc.cloudfront.net/media/public/avatars/wills-1636619076.jpg"),
                    ),
                    Gaps.h5,
                    Expanded(
                      child: Text(
                        "Aute magna irure consequat laborum magna veniam tempor do.",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Sizes.size14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    FaIcon(
                      FontAwesomeIcons.heart,
                      size: Sizes.size14,
                      color: Colors.grey.shade600,
                    ),
                    Gaps.h3,
                    Text(
                      "2.0M",
                      style: TextStyle(
                        fontSize: Sizes.size12,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade600,
                      ),
                    )
                  ],
                )
              ],
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

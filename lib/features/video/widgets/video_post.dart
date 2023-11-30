import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/video/widgets/video_button.dart';
import 'package:tiktok/features/video/widgets/video_comments.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  final Function onVideoFinished;
  final int index;

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video1.mp4");

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    setState(() {});
    _videoPlayerController.addListener(_onVideoChange);
  }

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!mounted) return;
    if (info.visibleFraction * 100 == 100 &&
        _isPlay &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
    // if (!mounted) return;
    // if (info.visibleFraction == 0 && _videoPlayerController.value.isPlaying) {
    //   _onTogglePause();
    // }
  }

  bool _isPlay = true;
  final Duration _animationDuration = const Duration(milliseconds: 200);
  late final AnimationController _animationController;

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPlay = !_isPlay;
    });
  }

  bool _isSeeMoreClicked = false;
  int _maxLines = 1;

  void _onSeeMoreTap() {
    if (_isSeeMoreClicked) {
      _maxLines = 1;
    } else {
      _maxLines = 3;
    }
    setState(() {
      _isSeeMoreClicked = !_isSeeMoreClicked;
    });
  }

  void _onCommetTap() async {
    bool alreadyPause = false;
    _isPlay ? _onTogglePause() : alreadyPause = true;
    await showModalBottomSheet(
      context: context,
      builder: (context) => const VideoComments(),
      backgroundColor: Colors.transparent,
      // isScrollControlled: true,
      scrollControlDisabledMaxHeightRatio: 0.75,
    );
    alreadyPause ? null : _onTogglePause();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: _onVisibilityChanged,
      key: Key(widget.index.toString()),
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned(
            child: IgnorePointer(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animationController.value,
                    child: child,
                  );
                },
                child: AnimatedOpacity(
                  opacity: _isPlay ? 0 : 1,
                  duration: _animationDuration,
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white60,
                      size: Sizes.size52,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "@Willis",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v10,
                Row(
                  children: [
                    SizedBox(
                      width: 230,
                      child: Text(
                        "This is my house's garden. Proident ut sunt id amet ex elit laboris sint sit reprehenderit do.",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        maxLines: _maxLines,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                        onTap: _onSeeMoreTap,
                        child: !_isSeeMoreClicked
                            ? const Text(
                                "See more",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.size16 + Sizes.size1,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : const FaIcon(
                                FontAwesomeIcons.angleDown,
                                color: Colors.white,
                                size: Sizes.size14,
                              ))
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            right: 10,
            child: Column(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    // foregroundImage: NetworkImage(
                    //     "https://d1telmomo28umc.cloudfront.net/media/public/avatars/wills-1636619076.jpg"),
                    child: Text(
                      "Willis".substring(0, 3),
                    )),
                Gaps.v20,
                const VideoButton(
                    icon: FontAwesomeIcons.solidHeart, text: "2.9M"),
                Gaps.v20,
                GestureDetector(
                  onTap: _onCommetTap,
                  child: const VideoButton(
                      icon: FontAwesomeIcons.solidMessage, text: "33.0k"),
                ),
                Gaps.v20,
                const VideoButton(icon: FontAwesomeIcons.share, text: "Share"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

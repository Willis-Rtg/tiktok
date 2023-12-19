import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/features/authentication/email_screen.dart';
import 'package:tiktok/features/authentication/login_screen.dart';
import 'package:tiktok/features/authentication/sign_up_screen.dart';
import 'package:tiktok/features/authentication/username_screen.dart';
import 'package:tiktok/features/main_navigation/main_navigation_screen.dart';
import 'package:tiktok/features/onboarding/interests_screen.dart';
import 'package:tiktok/features/user/user_profile_screen.dart';
import 'package:tiktok/features/video/video_recording_screen.dart';
import 'package:tiktok/features/video/video_timeline_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        path: SignUpScreen.routeName,
        builder: (context, state) => const VideoRecordingScreen()),
    GoRoute(
        path: LoginScreen.routeName,
        builder: (context, state) => const LoginScreen()),
    GoRoute(
        path: UsernameScreen.routeName,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: const UsernameScreen(),
              transitionsBuilder: (context, animation, animation2, child) {
                return ScaleTransition(
                  scale: animation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              });
        }),
    GoRoute(
        path: EmailScreen.routeName,
        builder: (context, state) {
          final args = state.extra as EmailScreenArgs;
          return EmailScreen(username: args.username);
        }),
    GoRoute(
      path: "/user/:username",
      builder: (context, state) {
        final username = state.pathParameters["username"];
        final tab = state.uri.queryParameters["show"];
        return UserProfileScreen(
          username: username!,
          tab: tab!,
        );
      },
    ),
    GoRoute(
      path: const InterestsScreen().routeName,
      builder: (context, state) => const InterestsScreen(),
    ),
    GoRoute(
      path: const MainNavigationScreen().routeName,
      builder: (context, state) => const MainNavigationScreen(),
    ),
    // GoRoute(
    //   path: "/video",
    //   routes: [
    //     GoRoute(
    //       path: const VideoTimelineScreen().routeName,
    //       builder: (context, state) => const VideoTimelineScreen(),
    //     ),
    //     GoRoute(
    //       path: const VideoRecordingScreen().routeName,
    //       builder: (context, state) => const VideoRecordingScreen(),
    //     )
    //   ],
    // )
  ],
);

import 'package:flutter/material.dart';

class UnfocusWidget extends StatelessWidget {
  const UnfocusWidget({super.key, required this.child});

  final Widget child;

  void unfocuse(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: () => unfocuse(context),
    );
  }
}

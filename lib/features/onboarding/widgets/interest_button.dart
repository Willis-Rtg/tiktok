import 'package:flutter/material.dart';
import 'package:tiktok/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  void _onTap() {
    _isSelected = !_isSelected;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(microseconds: 500),
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size16,
          vertical: Sizes.size12,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(15),
            color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 1,
                color: Colors.black12.withOpacity(.1),
              )
            ]),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(microseconds: 500),
          style: TextStyle(
              color: _isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w500),
          child: Text(
            widget.interest,
          ),
        ),
      ),
    );
  }
}

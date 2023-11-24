import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';

class SearchTextfield extends StatefulWidget {
  const SearchTextfield({super.key});

  @override
  State<SearchTextfield> createState() => _SearchTextfieldState();
}

class _SearchTextfieldState extends State<SearchTextfield> {
  final TextEditingController _textEditingController = TextEditingController();

  void _onSearchChange(value) {
    if (value != "") {
      _isWriting = true;
    } else {
      _isWriting = false;
    }
    setState(() {});
  }

  void _onSearchSubmitted(value) {}

  bool _isWriting = false;

  void _onClearTap() {
    _textEditingController.clear();
    setState(() {
      _isWriting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.size40,
      width: 1000,
      child: TextField(
        controller: _textEditingController,
        onChanged: _onSearchChange,
        onSubmitted: _onSearchSubmitted,
        decoration: InputDecoration(
          hintText: "Serching for...",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                Sizes.size5,
              ),
              borderSide: BorderSide.none),
          fillColor: Colors.grey.shade200,
          filled: true,
          contentPadding: const EdgeInsets.all(0),
          icon: const FaIcon(FontAwesomeIcons.angleLeft),
          prefixIconConstraints:
              const BoxConstraints.expand(width: Sizes.size36),
          prefixIcon: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gaps.h10,
              FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                size: Sizes.size16,
              ),
            ],
          ),
          suffixIconConstraints:
              const BoxConstraints.expand(width: Sizes.size40),
          suffixIcon: _isWriting
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gaps.h10,
                    GestureDetector(
                      onTap: _onClearTap,
                      child: const FaIcon(
                        FontAwesomeIcons.circleXmark,
                        size: Sizes.size16,
                      ),
                    ),
                  ],
                )
              : null,
        ),
      ),
    );
  }
}

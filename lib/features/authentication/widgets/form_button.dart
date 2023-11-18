import 'package:flutter/material.dart';
import 'package:tiktok/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
    this.nextPage,
    this.text,
    this.onTapfn,
  });

  final bool disabled;
  final Widget? nextPage;
  final String? text;
  final Function? onTapfn;

  void onButtonTap(BuildContext context) {
    if (onTapfn != null) onTapfn!();
    if (nextPage == null) return;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => nextPage!));
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: GestureDetector(
        onTap: () => disabled ? null : onButtonTap(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: Sizes.size14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: disabled
                ? Colors.grey.shade100
                : Theme.of(context).primaryColor,
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(microseconds: 300),
            style: TextStyle(
              color: disabled ? Colors.grey.shade500 : Colors.white,
              fontWeight: FontWeight.w600,
            ),
            child: Text(
              text ?? "Next",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

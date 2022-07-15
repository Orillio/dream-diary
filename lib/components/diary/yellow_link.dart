import 'package:flutter/material.dart';

class YellowLink extends StatelessWidget {
  final String text;
  final Function() onTapCallback;
  const YellowLink({required this.text, required this.onTapCallback, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: GestureDetector(
        onTap: onTapCallback,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: const Color(0xFFFFE926),
            ),
          ),
        ),
      ),
    );
  }
}

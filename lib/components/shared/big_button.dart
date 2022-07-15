import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const BigButton({this.onTap, required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 16),
          color: const Color(0xFFFFE926),
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}

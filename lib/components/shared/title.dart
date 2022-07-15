import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String text;
  const PageTitle({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge!,
      ),
    );
  }
}

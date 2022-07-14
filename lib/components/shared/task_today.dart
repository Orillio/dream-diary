import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TaskToday extends StatelessWidget {
  final String title;
  const TaskToday({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "•   $title",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        SvgPicture.asset("assets/reset.svg"),
      ],
    );
  }
}

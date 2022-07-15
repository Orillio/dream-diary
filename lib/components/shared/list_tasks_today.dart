import 'package:dream_diary/components/shared/task_today.dart';
import 'package:flutter/material.dart';

class ListTasksToday extends StatelessWidget {
  final List<String> tasks;
  const ListTasksToday({required this.tasks, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: tasks
        .map(
          (e) => Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TaskToday(title: e),
          ),
        )
        .toList(),
    );
  }
}

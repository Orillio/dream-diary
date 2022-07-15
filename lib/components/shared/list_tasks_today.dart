import 'package:dream_diary/components/shared/task_today.dart';
import 'package:flutter/material.dart';

import '../../models/task.dart';

class ListTasksToday extends StatelessWidget {
  final List<Task>? tasks;
  const ListTasksToday({required this.tasks, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(tasks == null) {
      return Container();
    }
    return ListView.builder(
      itemCount: tasks!.length,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TaskToday(title: tasks![index].text!),
        );
      },
    );
  }
}

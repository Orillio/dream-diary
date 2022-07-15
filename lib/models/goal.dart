import 'dart:typed_data';

import 'dream.dart';
import 'task.dart';

class Goal {
  late String title;
  late String caption;
  late String imageUrl;
  bool? isMainGoal;
  late bool fromNetwork;
  Uint8List? rawImage;
  List<Task>? tasks;

  Goal.fromDream(Dream dream) {
    title = dream.title;
    caption = dream.caption;
    imageUrl = dream.imageUrl;
    fromNetwork = dream.fromNetwork;
    rawImage = dream.rawImage;
  }

  Goal({required this.title, required this.caption, required this.imageUrl, this.tasks, required this.fromNetwork});
}
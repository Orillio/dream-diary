import 'Task.dart';

class Goal {
  String title;
  String caption;
  String imageUrl;
  bool? isMainGoal;
  List<Task>? tasks;
  Goal({required this.title, required this.caption, required this.imageUrl});
}
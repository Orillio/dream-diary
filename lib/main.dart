import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: 'Dream Diary',
    );
  }
}

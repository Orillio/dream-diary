import 'package:dream_diary/home/home_page.dart';
import 'package:dream_diary/themes/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: DarkTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Dream Diary',
      home: Home(),
    );
  }
}

import 'package:dream_diary/bottom_bar_items/community_page.dart';
import 'package:dream_diary/bottom_bar_items/diary_page.dart';
import 'package:dream_diary/bottom_bar_items/home_page.dart';
import 'package:dream_diary/bottom_bar_items/profile_page.dart';
import 'package:flutter/material.dart';

class BottomNavigationModel extends ChangeNotifier {
  int _index = 0;

  List<Widget> bottomBarItems = const [
    HomePage(),
    DiaryPage(),
    CommunityPage(),
    ProfilePage()
  ];

  set selectedIndex(int newIndex)  {
    _index = newIndex;
    notifyListeners();
  }
  int get selectedIndex {
    return _index;
  }

  Color getColorDependingOnSelected(BuildContext context, int index) {
    if (index == selectedIndex) {
      return Theme.of(context).bottomNavigationBarTheme.selectedItemColor!;
    }
    return Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!;
  }
}
import 'package:flutter/material.dart';
import '../pages/community_page.dart';
import '../pages/diary_page.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';

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
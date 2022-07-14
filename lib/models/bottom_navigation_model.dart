import 'package:flutter/material.dart';

class BottomNavigationModel extends ChangeNotifier {
  int _index = 0;

  List<Widget> bottomBarItems = [

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
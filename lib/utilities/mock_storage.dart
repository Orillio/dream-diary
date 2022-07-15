import 'package:flutter/material.dart';

import '../models/dream.dart';
import '../models/goal.dart';

class MockStorage extends ChangeNotifier {
  static final List<Dream> dreams = [
    Dream(
      fromNetwork: true,
      imageUrl: "https://img2.fonwall.ru/o/xa/fog-forest-lake-kide.jpg?route=mid&amp;h=750",
      title: "Хочу в поход в Гималаи",
      caption: "Одно из моих желаний на НГ - оказаться в горах.",
    )
  ];
  static List<Goal> goals = [
    Goal(
      imageUrl: "https://img.audiomania.ru/images/content/c1db7d0c0938a5e2eae2a73796eefcad.jpg",
      title: "Записать собственный трек",
      caption: "Друзья говорят, у меня получается неплохо петь. Вот и проверим!",
    )
  ];

  addDream(Dream dream) {
    dreams.add(dream);
    notifyListeners();
  }
  addGoal(Goal goal) {
    goals.add(goal);
    notifyListeners();
  }
}

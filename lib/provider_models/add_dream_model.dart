import 'dart:typed_data';

import 'package:dream_diary/models/dream.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utilities/mock_storage.dart';

class AddDreamModel extends ChangeNotifier {
  Image? _image;
  Uint8List? _rawImage;
  int _index = 0;
  final pageController = PageController(initialPage: 0);
  final dreamTextController = TextEditingController();

  Dream formDream() {
    return Dream(
      title: "Моя новая мечта",
      caption: dreamTextController.text,
      fromNetwork: false,
      imageUrl: "",
      rawImage: _rawImage,
    );
  }

  set pageIndex(int index) {
    _index = index;
    notifyListeners();
  }

  int get pageIndex {
    return _index;
  }

  set rawImage(Uint8List? bytes) {
    _rawImage = bytes;
    notifyListeners();
  }

  Uint8List? get rawImage {
    return _rawImage;
  }

  set image(Image? img) {
    _image = img;
    notifyListeners();
  }

  Image? get image {
    return _image;
  }
}

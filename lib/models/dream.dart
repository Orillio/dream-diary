import 'dart:typed_data';

class Dream {
  String title;
  String caption;
  String imageUrl;
  bool fromNetwork;
  Uint8List? rawImage;
  Dream({required this.title, required this.caption, required this.imageUrl, required this.fromNetwork, this.rawImage});
}
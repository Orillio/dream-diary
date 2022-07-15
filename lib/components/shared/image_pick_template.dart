import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImagePickTemplate extends StatelessWidget {
  const ImagePickTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF111111),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.9,
      child: Center(
        child: SvgPicture.asset("assets/pick_image.svg"),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../components/shared/image_pick_template.dart';
import '../../../provider_models/add_dream_model.dart';

class DreamCreating1 extends StatelessWidget {
  const DreamCreating1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<AddDreamModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(
                  "Визуализируй мечту",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              GestureDetector(
                onTap: () {
                  model.pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: SvgPicture.asset(
                  "assets/arrow_grey.svg",
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: PickImageWidget(),
            ),
          )
        ],
      ),
    );
  }
}

class PickImageWidget extends StatelessWidget {
  PickImageWidget({Key? key}) : super(key: key);

  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var model = context.watch<AddDreamModel>();

    return GestureDetector(
      onTap: () async {
        XFile? image = await _picker.pickImage(source: ImageSource.gallery);
        if (image == null) return;
        model.rawImage = await image.readAsBytes();
        model.image = Image.file(File(image.path));
      },
      child: model.image ?? const ImagePickTemplate(),
    );
  }
}

import 'package:dream_diary/utilities/mock_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../components/shared/custom_text_field.dart';
import '../../../provider_models/add_dream_model.dart';

class DreamCreating2 extends StatelessWidget {
  const DreamCreating2({Key? key}) : super(key: key);

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
              GestureDetector(
                onTap: Get.back,
                child: SvgPicture.asset(
                  "assets/cross.svg",
                ),
              ),
              GestureDetector(
                onTap: () {
                  MockStorage().addDream(model.formDream());
                  Get.back();
                },
                child: SvgPicture.asset(
                  "assets/arrow_grey.svg",
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(model.image != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 150,
                      child: model.image,
                    )
                  ),
                ),
              CustomTextField(),
            ],
          )
        ],
      ),
    );
  }
}

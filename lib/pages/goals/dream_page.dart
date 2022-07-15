import 'dart:ui';

import 'package:dream_diary/components/shared/big_button.dart';
import 'package:dream_diary/utilities/mock_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:themed/themed.dart';

import '../../models/dream.dart';
import 'goal_edit_page.dart';

class DreamPage extends StatelessWidget {
  final Dream dream;
  const DreamPage({required this.dream, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              if (dream.fromNetwork)
                ChangeColors(
                  brightness: -0.15,
                  child: Image.network(
                    dream.imageUrl,
                  ),
                ),
              if (!dream.fromNetwork)
                ChangeColors(
                  brightness: -0.1,
                  child: Image.memory(
                    dream.rawImage!,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: Get.back,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SvgPicture.asset("assets/arrow_back.svg"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SvgPicture.asset("assets/add.svg"),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Padding(
                  padding: EdgeInsets.symmetric(),
                  child: BigButton(
                    text: "Сделать целью",
                    onTap: () {
                      Get.to(() => GoalEditPage.createFromDream(dream));
                    },
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      dream.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        dream.caption,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

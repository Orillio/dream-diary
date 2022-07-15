import 'package:dream_diary/components/shared/title.dart';
import 'package:dream_diary/utilities/mock_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/shared/goals_card.dart';

class GoalsListPage extends StatelessWidget {
  const GoalsListPage({Key? key}) : super(key: key);

  _toAddGoal() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {

          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                        onTap: _toAddGoal(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: SvgPicture.asset("assets/add.svg"),
                        ),
                      ),
                    ],
                  ),
                  const PageTitle(text: "Мои цели"),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: MockStorage.goals.length,
                    itemBuilder: (context, index) {
                      return GoalsCard(goal: MockStorage.goals[index]);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
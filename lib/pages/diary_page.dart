import 'package:dream_diary/components/diary/yellow_link.dart';
import 'package:dream_diary/components/shared/dreams_card.dart';
import 'package:dream_diary/pages/goals/dreams_list_page.dart';
import 'package:dream_diary/pages/goals/goals_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/shared/goals_card.dart';
import '../components/shared/title.dart';
import '../utilities/mock_storage.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const PageTitle(
                  text: "Мой дневник",
                ),
                YellowLink(
                  text: "Мечты",
                  onTapCallback: () {
                    Get.to(() => const DreamsListPage());
                  },
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: MockStorage.dreams.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: DreamsCard(dream: MockStorage.dreams[index]),
                    );
                  },
                ),
                YellowLink(
                  text: "Цели",
                  onTapCallback: () {
                    Get.to(const GoalsListPage());
                  },
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: MockStorage.goals.length,
                  itemBuilder: (context, index) {
                    return GoalsCard(goal: MockStorage.goals[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:dream_diary/components/shared/dreams_card.dart';
import 'package:dream_diary/components/shared/title.dart';
import 'package:dream_diary/pages/goals/add_dream_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../utilities/mock_storage.dart';

class DreamsListPage extends StatelessWidget {
  const DreamsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MockStorage(),
      child: const _DreamsListPage(),
    );
  }
}

class _DreamsListPage extends StatelessWidget {
  const _DreamsListPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var model = context.watch<MockStorage>();
    void _toAddDream() {
      Get.to(const AddDreamPage())?.then((value) {
        model.notifyListeners();
      });
    }

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
                        onTap: _toAddDream,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: SvgPicture.asset("assets/add.svg"),
                        ),
                      ),
                    ],
                  ),
                  const PageTitle(text: "О чем я мечтаю"),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: MockStorage.dreams.length,
                    itemBuilder: (context, index) {
                      return DreamsCard(dream: MockStorage.dreams[index]);
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
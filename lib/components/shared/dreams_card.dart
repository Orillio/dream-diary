import 'package:dream_diary/pages/goals/dreams_list_page.dart';
import 'package:dream_diary/utilities/mock_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../models/dream.dart';
import '../../pages/goals/dream_page.dart';

class DreamsCard extends StatelessWidget {
  final Dream dream;
  const DreamsCard({required this.dream, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<MockStorage>();

    return GestureDetector(
      onTap: () {
        Get.to(DreamPage(dream: dream,))?.then((value) {
          model.notify();
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: dream.fromNetwork ? Image.network(
                  dream.imageUrl
              ) : Image.memory(dream.rawImage!),
            ),
          ),
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
    );
  }
}

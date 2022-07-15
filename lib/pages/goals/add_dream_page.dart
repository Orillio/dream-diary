import 'package:dream_diary/pages/goals/dream_creating_pages/dream_creating_1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider_models/add_dream_model.dart';
import 'dream_creating_pages/dream_creating_2.dart';

class AddDreamPage extends StatelessWidget {
  const AddDreamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddDreamModel(),
      child: const _AddDreamPage(),
    );
  }
}

class _AddDreamPage extends StatelessWidget {
  const _AddDreamPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var model = context.watch<AddDreamModel>();
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          model.pageIndex = index;
        },
        physics: const NeverScrollableScrollPhysics(),
        controller: model.pageController,
        children: const [
          DreamCreating1(),
          DreamCreating2(),
        ],
      ),
    );
  }
}

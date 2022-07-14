import 'package:dream_diary/provider_models/diary_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DiaryPageModel(),
      child: const _DiaryPage(),
    );
  }
}


class _DiaryPage extends StatelessWidget {
  const _DiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<DiaryPageModel>();
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  "Мой дневник",
                  style: Theme.of(context).textTheme.titleLarge!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

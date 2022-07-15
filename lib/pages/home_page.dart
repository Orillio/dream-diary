import 'package:dream_diary/components/shared/goals_card.dart';
import 'package:dream_diary/components/shared/list_tasks_today.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shared/title.dart';
import '../models/goal.dart';
import '../utilities/mock_storage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {

        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: 1000,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const PageTitle(
                    text: "Привет, Егор",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Моя цель",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  GoalsCard(
                    goal: MockStorage.goals[0]
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Дела на сегодня",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  const ListTasksToday(
                    tasks: [
                      "Оборудовать комнату",
                      "Помочь Диме с музыкой",
                      "Собраться втроем на прогон",
                    ],
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

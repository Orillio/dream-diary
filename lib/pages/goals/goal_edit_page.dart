import 'package:dream_diary/components/shared/list_tasks_today.dart';
import 'package:dream_diary/models/task.dart';
import 'package:dream_diary/provider_models/edit_goal_model.dart';
import 'package:dream_diary/utilities/mock_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:themed/themed.dart';

import '../../components/shared/big_button.dart';
import '../../models/dream.dart';
import '../../models/goal.dart';

class GoalEditPage extends StatelessWidget {
  GoalEditPage({Key? key}) : super(key: key);
  Goal? _goal;

  GoalEditPage.createFromDream(Dream dream) {
    MockStorage.dreams.remove(dream);
    var newGoal = Goal.fromDream(dream);
    _goal = newGoal;
    MockStorage.goals.add(newGoal);
  }
  GoalEditPage.createFromGoal(this._goal);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditGoalModel.fromGoal(_goal!),
      child: _GoalEditPage(),
    );
  }
}
class _GoalEditPage extends StatelessWidget {
  _GoalEditPage({Key? key}) : super(key: key);
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var model = context.watch<EditGoalModel>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                if (model.goal.fromNetwork)
                  ChangeColors(
                    brightness: -0.15,
                    child: Image.network(
                      model.goal.imageUrl,
                    ),
                  ),
                if (!model.goal.fromNetwork)
                  ChangeColors(
                    brightness: -0.1,
                    child: Image.memory(
                      model.goal.rawImage!,
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

              ],
            ),
            Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      if (model.goal.tasks != null && model.goal.tasks!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Что нужно сделать",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ListTasksToday(tasks: model.goal.tasks),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextField(
                                controller: textController,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0,
                                      color: Colors.transparent
                                    )
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFFFE926)
                                    )
                                  ),
                                  hintStyle: Theme.of(context).textTheme.titleMedium,
                                  hintText: "Добавить задачу"
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if(textController.text.isNotEmpty){
                                  model.addNewTask(
                                    Task(text: textController.text)
                                  );
                                }
                              },
                              child: SvgPicture.asset("assets/add.svg"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

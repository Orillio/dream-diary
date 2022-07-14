import 'package:dream_diary/components/shared/list_tasks_today.dart';
import 'package:dream_diary/provider_models/home_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomePageModel(),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<HomePageModel>();
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
                  "Привет, Егор",
                  style: Theme.of(context).textTheme.titleLarge!,
                ),
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
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://img.audiomania.ru/images/content/c1db7d0c0938a5e2eae2a73796eefcad.jpg",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Записать собственный трек",
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
                      """Друзья говорят, у меня получается неплохо петь. Вот и проверим!""",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
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
    );
  }
}

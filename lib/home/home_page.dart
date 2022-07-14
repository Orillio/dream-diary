import 'package:dream_diary/models/bottom_navigation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => BottomNavigationModel(), child: const _HomePage());
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bottomNavModel = context.watch<BottomNavigationModel>();
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          onTap: (index) {
            bottomNavModel.selectedIndex = index;
          },
          currentIndex: bottomNavModel.selectedIndex,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 40,
                child: SvgPicture.asset(
                  "assets/home.svg",
                  color: bottomNavModel.getColorDependingOnSelected(context, 0),
                ),
              ),
              label: "Домой",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 40,
                child: SvgPicture.asset(
                  "assets/notes.svg",
                  color: bottomNavModel.getColorDependingOnSelected(context, 1),
                ),
              ),
              label: "Дневник",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 40,
                child: SvgPicture.asset(
                  "assets/group.svg",
                  color: bottomNavModel.getColorDependingOnSelected(context, 2),
                ),
              ),
              label: "Сообщество",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 40,
                child: SvgPicture.asset(
                  "assets/profile.svg",
                  color: bottomNavModel.getColorDependingOnSelected(context, 3),
                ),
              ),
              label: "Профиль",
            ),
          ],
        ),
      ),
    );
  }
}

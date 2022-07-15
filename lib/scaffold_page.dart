import 'dart:io';

import 'package:dream_diary/provider_models/bottom_navigation_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class ScaffoldPage extends StatelessWidget {
  const ScaffoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => BottomNavigationModel(), child: const _ScaffoldPage());
  }
}

class _ScaffoldPage extends StatelessWidget {
  const _ScaffoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bottomNavModel = context.watch<BottomNavigationModel>();
    var pageController = PageController(
      initialPage: bottomNavModel.selectedIndex,
    );
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: Platform.isIOS ? 100 : 70,
        child: BottomNavigationBar(
          onTap: (index) {
            pageController.animateTo(
              MediaQuery.of(context).size.width * index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
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
      body: PageView(
        controller: pageController,
        children: bottomNavModel.bottomBarItems,
        onPageChanged: (newPageIndex) {
          bottomNavModel.selectedIndex = newPageIndex;
        },
      ),
    );
  }
}

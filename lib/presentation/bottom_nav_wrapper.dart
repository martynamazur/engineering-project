import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../navigation/app_router.dart';

@RoutePage()
class BottomNavWrapperScreen extends StatelessWidget {
  const BottomNavWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes:  [
        HomeRoute(),
        CreatedOutfitsRoute(),
        AddClothesRoute(),
        PlannerRoute(),
        MyProfileRoute()
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: 'Closet',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.filter_tilt_shift, color: Colors.black),
              label: 'Outfits',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, color: Colors.black),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded, color: Colors.black),
              label: 'Planer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}

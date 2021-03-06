import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/modules/food_bank/food_bank.dart';
import 'package:mobile/src/modules/home/screens/home_screen.dart';
import 'package:mobile/src/modules/setting/setting_screen.dart';
import 'package:mobile/src/modules/user/user_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  void changeIndex(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeScreen(),
          UserScreen(),
          FoodBank(),
          SettingScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Palette.pink500,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: changeIndex,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.house),
            activeIcon: Icon(PhosphorIcons.houseFill),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.magnifyingGlass),
            activeIcon: Icon(PhosphorIcons.magnifyingGlassFill),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.plusCircle),
            activeIcon: Icon(PhosphorIcons.plusCircleFill),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.heart),
            activeIcon: Icon(PhosphorIcons.heartFill),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.userCircle),
            activeIcon: Icon(PhosphorIcons.userCircleFill),
            label: 'User',
          )
        ],
      ),
    );
  }
}

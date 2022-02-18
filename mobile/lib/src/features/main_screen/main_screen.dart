import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/palette.dart';
import 'package:mobile/src/features/food_bank/food_bank.dart';
import 'package:mobile/src/features/home/screens/home_screen.dart';
import 'package:mobile/src/features/setting/setting_screen.dart';
import 'package:mobile/src/features/user/user_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

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
        onTap: (value) => changeIndex(value),
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            activeIcon: Icon(Icons.add_circle_rounded),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded),
            activeIcon: Icon(Icons.favorite_rounded),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            activeIcon: Icon(Icons.account_circle_rounded),
            label: "User",
          )
        ],
      ),
    );
  }
}

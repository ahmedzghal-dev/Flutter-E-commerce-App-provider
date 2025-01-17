import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app_provider/Provider/theme_provider.dart';
import 'package:flutter_e_commerce_app_provider/constants.dart';
import 'package:flutter_e_commerce_app_provider/screens/Cart/cart_screen.dart';
import 'package:flutter_e_commerce_app_provider/screens/HOME/home_screen.dart';
import 'package:flutter_e_commerce_app_provider/screens/Favorite/favorite.dart';
import 'package:flutter_e_commerce_app_provider/screens/TestScreen/test_screen.dart';
import 'package:flutter_e_commerce_app_provider/screens/profile/profile.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 2;
  List screens = const [
    TestScreen(),
    Favorite(),
    HomeScreen(),
    CartScreen(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor:
            themeProvider.getColorFromTheme('colorScheme.buttonColor'),
        child: const Icon(
          Icons.home,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 65,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: Icon(
                Icons.grid_view_outlined,
                size: 30,
                color: currentIndex == 0
                    ? themeProvider.getColorFromTheme('colorScheme.iconColor')
                    : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: Icon(
                Icons.favorite_border,
                size: 30,
                color: currentIndex == 1
                    ? themeProvider.getColorFromTheme('colorScheme.iconColor')
                    : Colors.grey.shade400,
              ),
            ),
            const SizedBox(width: 15),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
                color: currentIndex == 3
                    ? themeProvider.getColorFromTheme('colorScheme.iconColor')
                    : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 4;
                });
              },
              icon: Icon(
                Icons.person_outline,
                size: 30,
                color: currentIndex == 4
                    ? themeProvider.getColorFromTheme('colorScheme.iconColor')
                    : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}

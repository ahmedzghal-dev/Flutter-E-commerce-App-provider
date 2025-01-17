import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app_provider/Provider/theme_provider.dart';
import 'package:provider/provider.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: themeProvider.getColorFromTheme('colorScheme.background'),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        children: [
          Icon(
            Icons.search_outlined,
            color: themeProvider
                .getColorFromTheme('colorScheme.iconSecondaryColor'),
            size: 30,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: themeProvider
                      .getColorFromTheme('colorScheme.secondaryColor'),
                ),
              ),
            ),
          ),
          Container(
            height: 25,
            width: 1.5,
            color:
                themeProvider.getColorFromTheme('colorScheme.secondaryColor'),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.tune,
              color: themeProvider
                  .getColorFromTheme('colorScheme.iconSecondaryColor'),
            ),
          ),
        ],
      ),
    );
  }
}

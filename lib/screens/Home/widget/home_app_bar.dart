import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app_provider/Provider/theme_provider.dart';
import 'package:flutter_e_commerce_app_provider/screens/Color%20Palette/color_palette.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor:
                themeProvider.getColorFromTheme('colorScheme.buttonColor'),
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ColorPalette()));
          },
          icon: Image.asset(
            "assets/icon.png",
            height: 20,
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () {},
          iconSize: 30,
          icon: Icon(
            Icons.light_mode,
            color: themeProvider.getColorFromTheme('colorScheme.iconColor'),
          ),
        ),
      ],
    );
  }
}

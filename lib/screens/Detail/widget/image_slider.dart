import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app_provider/Provider/theme_provider.dart';
import 'package:provider/provider.dart';

class Myassetslider extends StatelessWidget {
  final Function(int) onChange;
  final String image;
  const Myassetslider({
    super.key,
    required this.image,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      height: 250,
      color: themeProvider.getColorFromTheme('colorScheme.containerFadeColor'),
      child: PageView.builder(
        onPageChanged: onChange,
        itemBuilder: (context, index) {
          return Hero(
            tag: image,
            child: Image.asset(image),
          );
        },
      ),
    );
  }
}

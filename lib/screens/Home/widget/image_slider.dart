import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app_provider/Provider/theme_provider.dart';
import 'package:provider/provider.dart';

class assetslider extends StatelessWidget {
  final Function(int) onChange;
  final int currentSlide;
  const assetslider(
      {super.key, required this.currentSlide, required this.onChange});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Stack(
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: onChange,
              physics: const ClampingScrollPhysics(),
              children: [
                Image.asset("assets/slider.jpg", fit: BoxFit.cover),
                Image.asset("assets/image1.png", fit: BoxFit.cover),
                Image.asset("assets/slider3.png", fit: BoxFit.cover),
              ],
            ),
          ),
        ),
        Positioned.fill(
            bottom: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => AnimatedContainer(
                    duration: const Duration(microseconds: 300),
                    width: currentSlide == index ? 15 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentSlide == index
                            ? themeProvider
                                .getColorFromTheme('colorScheme.buttonColor')
                            : Colors.transparent,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.4))),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

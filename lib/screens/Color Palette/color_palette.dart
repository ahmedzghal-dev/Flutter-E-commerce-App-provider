import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_e_commerce_app_provider/Provider/theme_provider.dart';

class ColorPalette extends StatelessWidget {
  ColorPalette({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor:
                themeProvider.getColorFromTheme('colorScheme.appbarColor'),
            title: const Text("Color Palette"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildThemeButton(
                  label: "PATISSERIE / BOULANGERIE",
                  colorPath: 'colorCategory.patisserieColor',
                  onTap: () =>
                      themeProvider.changeTheme(ThemeEnum.patisserieTheme),
                  themeProvider: themeProvider,
                ),
                _buildThemeButton(
                  label: "BOUTIQUE",
                  colorPath: 'colorCategory.boutiqueColor',
                  onTap: () =>
                      themeProvider.changeTheme(ThemeEnum.boutiqueTheme),
                  themeProvider: themeProvider,
                ),
                _buildThemeButton(
                  label: "SUPÉRETTE / ÉPICERIE",
                  colorPath: 'colorCategory.superatteColor',
                  onTap: () =>
                      themeProvider.changeTheme(ThemeEnum.superetteTheme),
                  themeProvider: themeProvider,
                ),
                _buildThemeButton(
                  label: "CAFÉ / RESTO",
                  colorPath: 'colorCategory.cafeColor',
                  onTap: () => themeProvider.changeTheme(ThemeEnum.cafeTheme),
                  themeProvider: themeProvider,
                ),
                _buildThemeButton(
                  label: "PHARMACIE",
                  colorPath: 'colorCategory.pharmacieColor',
                  onTap: () =>
                      themeProvider.changeTheme(ThemeEnum.pharmacieTheme),
                  themeProvider: themeProvider,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildThemeButton({
    required String label,
    required String colorPath,
    required VoidCallback onTap,
    required ThemeProvider themeProvider,
  }) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 220,
          height: 60,
          decoration: BoxDecoration(
            color: themeProvider.getColorFromTheme(colorPath),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color:
                    themeProvider.getColorFromTheme('colorScheme.appbarColor'),
                offset: Offset(1.0, 1.0),
                blurRadius: 15.0,
                spreadRadius: 0.8,
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

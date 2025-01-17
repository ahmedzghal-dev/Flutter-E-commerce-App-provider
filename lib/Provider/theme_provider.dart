import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

enum ThemeEnum {
  defaultTheme,
  patisserieTheme,
  boutiqueTheme,
  superetteTheme,
  cafeTheme,
  pharmacieTheme,
}

class ThemeProvider extends ChangeNotifier {
  ThemeEnum currentTheme = ThemeEnum.defaultTheme;
  ThemeData? currentThemeData;
  Map<String, dynamic>? themeJson;

  final Map<ThemeEnum, String> themePaths = {
    ThemeEnum.defaultTheme: "assets/themes/default_theme.json",
    ThemeEnum.patisserieTheme: "assets/themes/patisserie_theme.json",
    ThemeEnum.boutiqueTheme: "assets/themes/boutique_theme.json",
    ThemeEnum.superetteTheme: "assets/themes/superette_theme.json",
    ThemeEnum.cafeTheme: "assets/themes/cafe_theme.json",
    ThemeEnum.pharmacieTheme: "assets/themes/pharmacie_theme.json",
  };

  static ThemeProvider? _instance;
  static ThemeProvider get instance {
    _instance ??= ThemeProvider._init();
    return _instance!;
  }

  ThemeProvider._init();

  Future<void> changeTheme(ThemeEnum theme) async {
    currentTheme = theme;
    await _loadThemeData(theme);
    notifyListeners();
  }

  Future<void> _loadThemeData(ThemeEnum theme) async {
    //try {
    String path = themePaths[theme] ?? themePaths[ThemeEnum.defaultTheme]!;
    String themeStr = await rootBundle.loadString(path);
    themeJson = jsonDecode(themeStr);
    //   if (themeJson != null) {
    //     currentThemeData =
    //         ThemeDecoder.decodeThemeData(themeJson!, validate: false);
    //   } else {
    //     throw Exception("Theme JSON is null");
    //   }
    // } catch (e) {
    //   print("Error loading theme: $e");

    // }
  }

  Color getColorFromTheme(String path) {
    if (themeJson == null) return Colors.transparent;

    try {
      List<String> keys = path.split('.');
      dynamic value = themeJson;
      for (var key in keys) {
        value = value[key];
        if (value == null) return Colors.transparent;
      }
      if (value is String) {
        String hexColor = value.replaceAll("#", "0xff");
        return Color(int.parse(hexColor));
      }
      return Colors.transparent;
    } catch (e) {
      print("Error getting color: $e");
      return Colors.transparent;
    }
  }
}

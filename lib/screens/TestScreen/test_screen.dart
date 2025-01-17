import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app_provider/Provider/theme_provider.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            themeProvider.getColorFromTheme('colorScheme.appbarColor'),
        title: const Text("this widget is empty !!"),
        centerTitle: true,
      ),
    );
  }
}

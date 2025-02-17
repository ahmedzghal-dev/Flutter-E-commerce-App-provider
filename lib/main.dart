import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app_provider/Provider/cart_provider.dart';
import 'package:flutter_e_commerce_app_provider/Provider/favorite.provider.dart';
import 'package:flutter_e_commerce_app_provider/Provider/theme_provider.dart';
import 'package:flutter_e_commerce_app_provider/screens/nav_bar_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeProvider.instance.changeTheme(ThemeEnum.defaultTheme);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider.instance),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      builder: (context, widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          //theme: ThemeData(textTheme: GoogleFonts.mulishTextTheme()),
          theme: Provider.of<ThemeProvider>(context).currentThemeData,
          home: const BottomNavBar(),
        );
      },
    );
  }
}

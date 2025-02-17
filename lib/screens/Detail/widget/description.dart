import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app_provider/Provider/theme_provider.dart';
import 'package:flutter_e_commerce_app_provider/constants.dart';
import 'package:provider/provider.dart';

class Description extends StatelessWidget {
  final String description;
  const Description({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              decoration: BoxDecoration(
                color: themeProvider
                    .getColorFromTheme('colorScheme.containerColor'),
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Description",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Text(
              "Specifications",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const Text(
              "Reviews",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          description,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}

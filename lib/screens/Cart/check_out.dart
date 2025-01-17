import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app_provider/Provider/cart_provider.dart';
import 'package:flutter_e_commerce_app_provider/Provider/theme_provider.dart';
import 'package:provider/provider.dart';

class CheckOutBox extends StatelessWidget {
  const CheckOutBox({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    final provider = CartProvider.of(context);
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: themeProvider.getColorFromTheme('colorScheme.containerColor'),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              filled: true,
              fillColor:
                  themeProvider.getColorFromTheme('colorScheme.searchBarColor'),
              hintText: "Enter Discoutn Code",
              hintStyle: const TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              suffixIcon: TextButton(
                onPressed: () {},
                child: const Text(
                  "Apply",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "SbuTotal",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                "\$${provider.totalPrice()}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "total",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                "\$${provider.totalPrice()}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: themeProvider
                    .getColorFromTheme('colorScheme.containerFadeColor'),
                minimumSize: const Size(double.infinity, 55),
              ),
              onPressed: () {},
              child: const Text(
                "Check Out",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ))
        ],
      ),
    );
  }
}

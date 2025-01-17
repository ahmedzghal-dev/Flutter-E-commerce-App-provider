import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app_provider/Provider/theme_provider.dart';
import 'package:flutter_e_commerce_app_provider/constants.dart';
import 'package:flutter_e_commerce_app_provider/models/product_model.dart';
import 'package:provider/provider.dart';

class ItemDetails extends StatelessWidget {
  final Product product;
  const ItemDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                // rating
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: themeProvider
                            .getColorFromTheme('colorScheme.buttonColor'),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 14,
                            color: themeProvider.getColorFromTheme(
                                'colorScheme.iconSecondaryColor'),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            product.rate.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      product.review,
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: "Seller: ",
                    style: const TextStyle(fontSize: 16),
                  ),
                  TextSpan(
                    text: product.seller,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

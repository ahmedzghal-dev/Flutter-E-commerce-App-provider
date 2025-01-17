import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app_provider/Provider/favorite.provider.dart';
import 'package:flutter_e_commerce_app_provider/Provider/theme_provider.dart';
import 'package:flutter_e_commerce_app_provider/models/product_model.dart';
import 'package:provider/provider.dart';

class DetailAppBar extends StatelessWidget {
  final Product product;
  const DetailAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    final provider = FavoriteProvider.of(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor:
                  themeProvider.getColorFromTheme('colorScheme.iconColor'),
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          const Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor:
                  themeProvider.getColorFromTheme('colorScheme.iconColor'),
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          const SizedBox(width: 10),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor:
                  themeProvider.getColorFromTheme('colorScheme.iconColor'),
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              provider.toggleFavorite(product);
            },
            icon: Icon(
              provider.isExist(product)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

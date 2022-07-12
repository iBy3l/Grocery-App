import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_grocery_app/model/models.dart';
import 'package:ui_grocery_app/ui/theme/colors.dart';

import '../../../../bloc/favoriteslist/bloc/favoriteslist_bloc.dart';

class CartFavoritesListWidget extends StatelessWidget {
  const CartFavoritesListWidget(
      {Key? key, required this.product, this.isFavority = false})
      : super(key: key);
  final Product product;
  final bool isFavority;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        shadowColor: lightColorsPrimary,
        child: SizedBox(
          height: 90,
          width: 360,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                height: 80,
                width: 80,
                fit: BoxFit.contain,
                image: AssetImage(product.imgP),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        color: lightColorsPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$ ${product.price}',
                    style: const TextStyle(
                        color: lightColorsSecondary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              isFavority
                  ? BlocBuilder<FavoriteslistBloc, FavoriteslistState>(
                      builder: (context, state) {
                        return IconButton(
                            onPressed: () {
                              context
                                  .read<FavoriteslistBloc>()
                                  .add(RemoveFavoritelistProduct(product));
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: lightColorsSecondary,
                            ));
                      },
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

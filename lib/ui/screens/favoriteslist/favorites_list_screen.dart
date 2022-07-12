import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/favoriteslist/bloc/favoriteslist_bloc.dart';
import '../../shared/custom_appbar_pages.dart';
import '../../theme/colors.dart';
import 'elements/cart_favoritelist_widget.dart';

class FavoritesListScreen extends StatelessWidget {
  const FavoritesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppPagesWidget(
          title: 'Favorites list ❤️',
        ),
      ),
      body: BlocBuilder<FavoriteslistBloc, FavoriteslistState>(
        builder: (context, state) {
          if (state is FavoriteslistLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: lightColorsPrimary,
              ),
            );
          }
          if (state is FavoriteslistLoaded) {
            return ListView.builder(
                itemCount: state.favoritesList.product.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: CartFavoritesListWidget(
                      product: state.favoritesList.product[index],
                      isFavority: true,
                    ),
                  );
                });
          } else {
            return Text('Something went wrong');
          }
        },
      ),
    );
  }
}

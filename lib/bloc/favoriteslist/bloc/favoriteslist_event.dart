part of 'favoriteslist_bloc.dart';

abstract class FavoriteslistEvent extends Equatable {
  const FavoriteslistEvent();

  @override
  List<Object> get props => [];
}

class StartFavoritelist extends FavoriteslistEvent {}

class AddFavoritelistProduct extends FavoriteslistEvent {
  final Product product;

  const AddFavoritelistProduct(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFavoritelistProduct extends FavoriteslistEvent {
  final Product product;

  const RemoveFavoritelistProduct(this.product);

  @override
  List<Object> get props => [product];
}

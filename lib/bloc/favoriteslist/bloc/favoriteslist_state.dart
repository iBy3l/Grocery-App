part of 'favoriteslist_bloc.dart';

abstract class FavoriteslistState extends Equatable {
  @override
  List<Object> get props => [];
}

class FavoriteslistLoading extends FavoriteslistState {}

class FavoriteslistLoaded extends FavoriteslistState {
  final FavoritesList favoritesList;

  FavoriteslistLoaded({this.favoritesList = const FavoritesList()});

  @override
  List<Object> get props => [favoritesList];
}

class FavoriteslistError extends FavoriteslistState {}

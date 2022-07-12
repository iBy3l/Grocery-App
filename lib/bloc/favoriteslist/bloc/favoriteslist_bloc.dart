import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ui_grocery_app/model/models.dart';

part 'favoriteslist_event.dart';
part 'favoriteslist_state.dart';

class FavoriteslistBloc extends Bloc<FavoriteslistEvent, FavoriteslistState> {
  FavoriteslistBloc() : super(FavoriteslistLoading());

  @override
  Stream<FavoriteslistState> mapEventToState(
    FavoriteslistEvent event,
  ) async* {
    if (event is StartFavoritelist) {
      yield* _mapStartFavoritelistToState();
    } else if (event is AddFavoritelistProduct) {
      yield* _mapAddFavoritelistProduct(event, state);
    } else if (event is RemoveFavoritelistProduct) {
      yield* _mapRemoveFavoritelistProduct(event, state);
    }
  }

  Stream<FavoriteslistState> _mapStartFavoritelistToState() async* {
    yield FavoriteslistLoading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      yield FavoriteslistLoaded();
    } catch (_) {}
  }

  Stream<FavoriteslistState> _mapAddFavoritelistProduct(
    AddFavoritelistProduct event,
    FavoriteslistState state,
  ) async* {
    if (state is FavoriteslistLoaded) {
      try {
        yield FavoriteslistLoaded(
            favoritesList: FavoritesList(
                product: List.from(state.favoritesList.product)
                  ..add(event.product)));
      } catch (_) {}
    }
  }

  Stream<FavoriteslistState> _mapRemoveFavoritelistProduct(
    RemoveFavoritelistProduct event,
    FavoriteslistState state,
  ) async* {
    if (state is FavoriteslistLoaded) {
      try {
        yield FavoriteslistLoaded(
            favoritesList: FavoritesList(
                product: List.from(state.favoritesList.product)
                  ..remove(event.product)));
      } catch (_) {}
    }
  }
}

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesSuccess extends FavoritesState {
  final List<int> favoriteDrugIds;

  FavoritesSuccess(this.favoriteDrugIds);
}

class FavoritesFaliure extends FavoritesState {
  final String message;

  FavoritesFaliure(this.message);
}
class FavoriteActionSuccess extends FavoritesState {
  final String message;

  FavoriteActionSuccess(this.message);
}
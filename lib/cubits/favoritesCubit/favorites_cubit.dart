import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorites_state.dart';
import '../../services/favorites_service.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  List<int> favoriteIds = [];
  Future<void> loadFavorites(int userId) async {
    emit(FavoritesLoading());
    try {
      favoriteIds = await FavoritesService.getFavoriteDrugIds(userId);
      emit(FavoritesSuccess(favoriteIds));
      log(favoriteIds.length.toString());
    } catch (e) {
      emit(FavoritesFaliure(e.toString()));
    }
  }

  Future<void> toggleFavorite({
    required int userId,
    required int drugId,
  }) async {
    try {
      if (favoriteIds.contains(drugId)) {
        await FavoritesService.removeFromFavorites(
          userId: userId,
          drugId: drugId,
        );
        favoriteIds.remove(drugId);
        emit(FavoriteActionSuccess("تمت الإزالة من المفضلة"));
      } else {
        await FavoritesService.addToFavorites(userId: userId, drugId: drugId);
        favoriteIds.add(drugId);
        emit(FavoriteActionSuccess("تمت الإضافة إلى المفضلة"));
      }

      emit(FavoritesSuccess(List.from(favoriteIds)));
    } catch (e) {
      emit(FavoritesFaliure(e.toString()));
    }
  }
}

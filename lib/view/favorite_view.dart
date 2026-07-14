import 'package:doctorapp/cubits/authCubit/auth_cubit.dart';
import 'package:doctorapp/cubits/drugsCubit/drugs_cubit.dart';
import 'package:doctorapp/cubits/drugsCubit/drugs_state.dart';
import 'package:doctorapp/cubits/favoritesCubit/favorites_cubit.dart';
import 'package:doctorapp/cubits/favoritesCubit/favorites_state.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/widgets/medicine_container.dart';
import 'package:doctorapp/widgets/no_favorite_medicines.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    super.initState();
    final userId = context.read<AuthCubit>().currentUser!.id;
    context.read<FavoritesCubit>().loadFavorites(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyle.decoratedBackground(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 50),
        child: Column(
          children: [
            Center(
              child: Text(
                'المفضلة',
                style: AppStyle.customText(
                  context,
                  AppStyle.h1,
                  FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<DrugsCubit, DrugsState>(
                builder: (context, state) {
                  if (state is DrugsSuccess) {
                    return BlocBuilder<FavoritesCubit, FavoritesState>(
                      builder: (context, state) {
                        if (state is FavoritesLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          );
                        } else if (state is FavoritesSuccess) {
                          final favoriteIds = state.favoriteDrugIds;
                          if (favoriteIds.isEmpty) {
                            return NoFavoriteMedicines();
                          }
                          final allDrugs = context.read<DrugsCubit>().drugs;
                          final favoriteDrugs = allDrugs
                              .where((drug) => favoriteIds.contains(drug.id))
                              .toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: favoriteDrugs.length,
                            itemBuilder: (context, index) {
                              return MedicineContainer(
                                drug: favoriteDrugs[index],
                                ontap: () async {
                                  await context
                                      .read<FavoritesCubit>()
                                      .toggleFavorite(
                                        userId: context
                                            .read<AuthCubit>()
                                            .currentUser!
                                            .id,
                                        drugId: favoriteDrugs[index].id,
                                      );
                                },
                              );
                            },
                          );
                        } else if (state is FavoritesFaliure) {
                          return Center(
                            child: Text(
                              'حدث خطأ في جلب المفضلة',
                              style: AppStyle.customText(
                                context,
                                AppStyle.body,
                                FontWeight.w700,
                              ),
                            ),
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:doctorapp/cubits/favoritesCubit/favorites_cubit.dart';
import 'package:doctorapp/cubits/favoritesCubit/favorites_state.dart';
import 'package:doctorapp/model/drugs_model.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicineContainer extends StatelessWidget {
  const MedicineContainer({super.key, required this.drug, required this.ontap});

  final DrugsModel drug;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final favoritesCubit = context.read<FavoritesCubit>();
        final isFavorite = favoritesCubit.favoriteIds.contains(drug.id);
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: .5),
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.scrim,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: ontap,
                    child: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    drug.name,
                    style: AppStyle.containerText(
                      context,
                      AppStyle.title2,
                      FontWeight.bold,
                      Colors.blue.shade500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                drug.indications,
                textDirection: TextDirection.rtl,
                maxLines: 3,
                style: AppStyle.customText(
                  context,
                  AppStyle.bodySmall,
                  FontWeight.w700,
                ),
              ),
              Text(
                drug.risks,
                textDirection: TextDirection.rtl,
                style: AppStyle.containerText(
                  context,
                  AppStyle.bodySmall,
                  FontWeight.w800,
                  Colors.red,
                ),
              ),
              Text(
                drug.requiresPrescription
                    ? 'لا يحتاج إلى وصفة طبية'
                    : 'يحتاج إلى وصفة طبية',
                textDirection: TextDirection.rtl,
                style: AppStyle.containerText(
                  context,
                  AppStyle.bodySmall,
                  FontWeight.w800,
                  drug.requiresPrescription
                      ? Colors.green
                      : Colors.blue.shade500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

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
                      color: isFavorite ? Color(0xffb02a2b) : Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    drug.name,
                    style: AppStyle.containerText(
                      context,
                      AppStyle.title2,
                      FontWeight.bold,
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(width: 5),
                  drug.isRare
                      ? Icon(Icons.block, color: Colors.red)
                      : SizedBox.shrink(),
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
                  FontWeight.bold,
                ),
              ),
              Text(
                drug.risks,
                textDirection: TextDirection.rtl,
                style: AppStyle.containerText(
                  context,
                  AppStyle.bodySmall,
                  FontWeight.bold,
                  Color(0xffb02a2b),
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
                  FontWeight.bold,
                  drug.requiresPrescription
                      ? Color.fromARGB(255, 119, 184, 131)
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
              if (drug.isRare && drug.pharmacies.isNotEmpty) ...[
                const SizedBox(height: 8),
                Divider(color: Colors.grey.shade400),
                const SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "متوفر في الصيدليات التالية:",
                      textDirection: TextDirection.rtl,
                      style: AppStyle.containerText(
                        context,
                        AppStyle.bodySmall,
                        FontWeight.bold,
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 5),
                    ...drug.pharmacies.map(
                      (pharmacy) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              pharmacy.pharmacyPhone,
                              style: AppStyle.customText(
                                context,
                                AppStyle.bodySmall,
                                FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                pharmacy.pharmacyName,
                                textDirection: TextDirection.rtl,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyle.customText(
                                  context,
                                  AppStyle.bodySmall,
                                  FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Icon(
                              Icons.local_pharmacy,
                              size: 18,
                              color: Colors.red.shade400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

import 'package:doctorapp/model/drugs_model.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class MedicineContainer extends StatelessWidget {
  const MedicineContainer({super.key, required this.drug});
  final DrugsModel drug;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isFavorite = ValueNotifier(false);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
              ValueListenableBuilder<bool>(
                valueListenable: isFavorite,
                builder: (context, value, child) {
                  return InkWell(
                    onTap: () {
                      isFavorite.value = !isFavorite.value;
                    },
                    child: value
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_border_outlined),
                  );
                },
              ),
              Spacer(),
              Text(
                drug.name,
                style: AppStyle.containerText(
                  context,
                  AppStyle.title1,
                  FontWeight.bold,
                  Colors.blue.shade500,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 1.20),
            child: Text(
              drug.indications,
              textDirection: TextDirection.rtl,
              softWrap: true,
              maxLines: 3,
              style: AppStyle.customText(
                context,
                AppStyle.body,
                FontWeight.w700,
              ),
            ),
          ),
          Text(
            drug.risks,
            textDirection: TextDirection.rtl,
            style: AppStyle.containerText(
              context,
              AppStyle.body,
              FontWeight.w800,
              Colors.red,
            ),
          ),
          Text(
            drug.requiresPrescription
                ? 'لا يحتاج إلى وصفة طبية'
                : 'يحتاج إلى وصفة طبية',
            textDirection: TextDirection.rtl,
            style: AppStyle.containerText(
              context,
              AppStyle.body,
              FontWeight.w800,
              drug.requiresPrescription ? Colors.green : Colors.blue.shade500,
            ),
          ),
        ],
      ),
    );
  }
}

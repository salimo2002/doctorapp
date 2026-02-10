import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class MedicineContainer extends StatelessWidget {
  const MedicineContainer({super.key});

  @override
  Widget build(BuildContext context) {
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
              Icon(Icons.favorite_border_outlined),
              Spacer(),
              Text(
                'Paracetamol - باراسيتامول',
                style: AppStyle.containerText(
                  context,
                  18,
                  FontWeight.bold,
                  Colors.blue.shade700,
                ),
              ),
            ],
          ),
          Text(
            'شركة ابن الهيثم',
            style: AppStyle.customText(
              context,
              AppStyle.contextText,
              FontWeight.normal,
            ),
          ),
          Text(
            'يعالج صداع الرأس والحمى',
            style: AppStyle.customText(
              context,
              AppStyle.contextText,
              FontWeight.normal,
            ),
          ),
          Text(
            'يستخدم في حالات الالم البسيطة الى المتوسطة',
            style: AppStyle.customText(
              context,
              AppStyle.contextText,
              FontWeight.normal,
            ),
          ),
          Text(
            'الجرعات العالية قد تسبب تضرر الكبد',
            style: AppStyle.containerText(
              context,
              AppStyle.contextText,
              FontWeight.w800,
              Colors.red,
            ),
          ),
          Text(
            'لا يحتاج الباراسيتامول إلى وصفة طبية',
            style: AppStyle.containerText(
              context,
              AppStyle.contextText,
              FontWeight.w800,
              Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

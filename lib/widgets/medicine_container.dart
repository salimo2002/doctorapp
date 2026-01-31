import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class MedicineContainer extends StatelessWidget {
  const MedicineContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: .5),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/pill.png',
                height: 30,
                color: const Color.fromARGB(255, 51, 120, 176),
              ),
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
            style: AppStyle.customText(context, 16, FontWeight.normal),
          ),
          Text(
            'يعالج صداع الرأس والحمى',
            style: AppStyle.customText(context, 16, FontWeight.normal),
          ),
          Text(
            'يستخدم في حالات الالم البسيطة الى المتوسطة',
            style: AppStyle.customText(context, 16, FontWeight.normal),
          ),
          Text(
            'الجرعات العالية قد تسبب تضرر الكبد',
            style: AppStyle.containerText(
              context,
              16,
              FontWeight.w800,
              Colors.red,
            ),
          ),
          Text(
            'لا يحتاج الباراسيتامول إلى وصفة طبية',
            style: AppStyle.containerText(
              context,
              16,
              FontWeight.w800,
              Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

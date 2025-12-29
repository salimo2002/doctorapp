import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/widgets/custom_container.dart';
import 'package:doctorapp/widgets/info_label.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyle.decoratedBackground(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: ListView(
          children: [
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  'الرئيسية',
                  style: AppStyle.customText(context, 30, FontWeight.bold),
                ),
                Spacer(),
                Icon(
                  Icons.waving_hand_sharp,
                  color: Theme.of(context).colorScheme.primary,
                  size: 50,
                ),
              ],
            ),
            CustomContainer(
              cheldreen: [
                InfoLabel(
                  label: 'معلومة طبية',
                  icon: Icons.notifications_sharp,
                ),
                SizedBox(height: 10),
                Text(
                  '⚫️ لايجب استخدام الايبو بروفين على معدة فارغة',
                  style: AppStyle.customText(context, 18, FontWeight.normal),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 5),
                Text(
                  '⚫️ الانتباه لعدم تناول جرغات كبيرة من الايبو بروفين',
                  style: AppStyle.customText(context, 18, FontWeight.normal),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            CustomContainer(
              cheldreen: [
                InfoLabel(
                  label: 'دواء اليوم',
                  icon: Icons.medical_services_sharp,
                ),
                SizedBox(height: 5),
                Text(
                  'باراسيتامول  ',
                  style: AppStyle.customText(context, 22, FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '⚫️ مسكن وخافض للحرارة',
                  style: AppStyle.customText(context, 18, FontWeight.normal),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 5),
                Text(
                  '⚫️ لاينصح بتناول اكثر من 4 جرعات يوميا',
                  style: AppStyle.customText(context, 18, FontWeight.normal),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 5),
                Text(
                  '⚫️ الجرعة الزائدة تؤذي الكبد',
                  style: AppStyle.customText(context, 18, FontWeight.normal),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
                  style: AppStyle.customText(context, 28, FontWeight.bold),
                ),
                Spacer(),
                Icon(
                  Icons.home_work,
                  color: Theme.of(context).colorScheme.primary,
                  size: 50,
                ),
              ],
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 40,
              child: TextField(
                onTap: () {},
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  hint: Text(
                    'ابحث عن دواء',
                    textDirection: TextDirection.rtl,
                    style: AppStyle.customText(context, 18, FontWeight.normal),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
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
                  style: AppStyle.customText(context, 16, FontWeight.normal),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 5),
                Text(
                  '⚫️ الانتباه لعدم تناول جرغات كبيرة من الايبو بروفين',
                  style: AppStyle.customText(context, 16, FontWeight.normal),
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
                  style: AppStyle.customText(context, 20, FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '⚫️ مسكن وخافض للحرارة',
                  style: AppStyle.customText(context, 16, FontWeight.normal),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 5),
                Text(
                  '⚫️ لاينصح بتناول اكثر من 4 جرعات يوميا',
                  style: AppStyle.customText(context, 16, FontWeight.normal),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 5),
                Text(
                  '⚫️ الجرعة الزائدة تؤذي الكبد',
                  style: AppStyle.customText(context, 16, FontWeight.normal),
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

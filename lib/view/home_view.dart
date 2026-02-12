import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/widgets/custom_container.dart';
import 'package:doctorapp/widgets/info_label.dart';
import 'package:doctorapp/widgets/medicine_container.dart';
import 'package:doctorapp/widgets/search_text_field.dart';
import 'package:doctorapp/widgets/small_categories.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyle.decoratedBackground(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 40),
        child: Column(
          children: [
            Center(
              child: Text(
                'الرئيسية',
                style: AppStyle.customText(context, 28, FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: SearchTextField(
                hint: 'ابحث عن دواء',
                controller: TextEditingController(),
                focusNode: FocusNode(),
                ontap: () {},
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  CustomContainer(
                    cheldreen: [
                      InfoLabel(
                        label: 'معلومة طبية',
                        icon: Icons.notifications_sharp,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '⚫️ لايجب استخدام الايبو بروفين على معدة فارغة',
                        style: AppStyle.customText(
                          context,
                          AppStyle.contextText,
                          FontWeight.w700,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 5),
                      Text(
                        '⚫️ الانتباه لعدم تناول جرغات كبيرة من الايبو بروفين',
                        style: AppStyle.customText(
                          context,
                          AppStyle.contextText,
                          FontWeight.w700,
                        ),
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
                        style: AppStyle.customText(
                          context,
                          20,
                          FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '⚫️ مسكن وخافض للحرارة',
                        style: AppStyle.customText(
                          context,
                          AppStyle.contextText,
                          FontWeight.w700,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 5),
                      Text(
                        '⚫️ لاينصح بتناول اكثر من 4 جرعات يوميا',
                        style: AppStyle.customText(
                          context,
                          AppStyle.contextText,
                          FontWeight.w700,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 5),
                      Text(
                        '⚫️ الجرعة الزائدة تؤذي الكبد',
                        style: AppStyle.customText(
                          context,
                          AppStyle.contextText,
                          FontWeight.w700,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 40, child: SmallCategories()),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 19,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return MedicineContainer();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/widgets/search_text_field.dart';
import 'package:doctorapp/widgets/pharmacy_container.dart';
import 'package:doctorapp/widgets/small_categories.dart';
import 'package:flutter/material.dart';

class PharmaciesView extends StatelessWidget {
  const PharmaciesView({super.key});

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
                'الصيدليات',
                style: AppStyle.customText(
                  context,
                  AppStyle.h1,
                  FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: SearchTextField(
                hint: 'ابحث عن صيدلية',
                controller: TextEditingController(),
                focusNode: FocusNode(),
                ontap: () {},
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 40,
              child: SmallCategories(
                label1: 'جميع الصيدليات    ',
                label2: 'الصيدليات المناوبة',
                icon1: Icons.local_pharmacy,
                icon2: Icons.schedule,
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return PharmacyContainer(
                    pharmacyLabel: 'صيدلية اليرموك',
                    isOpen: false,
                    pharmacyLocation: () {},
                    location: 'شارع الحضارة - مقابل مجمع اليرموك',
                    address: 'الرياض',
                    workingHours: 'من الساعة 8:00 صباحا حتى 10:00 مساء',
                    phoneNumber: '0988818024',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

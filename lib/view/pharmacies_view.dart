import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/widgets/search_text_field.dart';
import 'package:doctorapp/widgets/pharmacy_container.dart';
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
                style: AppStyle.customText(context, 28, FontWeight.bold),
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
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 5),
                children: [
                  PharmacyContainer(
                    pharmacyLabel: 'صيدلية اليرموك',
                    isOpen: true,
                    pharmacyLocation: () {},
                    location: 'شارع الحضارة - مقابل مجمع اليرموك',
                    address: 'الرياض',
                    workingHours: 'من الساعة 8:00 صباحا حتى 10:00 مساء',
                    phoneNumber: '0988818024',
                  ),
                  PharmacyContainer(
                    pharmacyLabel: 'صيدلية اليرموك',
                    isOpen: false,
                    pharmacyLocation: () {},
                    location: 'شارع الحضارة - مقابل مجمع اليرموك',
                    address: 'الرياض',
                    workingHours: 'من الساعة 8:00 صباحا حتى 10:00 مساء',
                    phoneNumber: '0988818024',
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

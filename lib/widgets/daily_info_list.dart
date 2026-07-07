
import 'package:doctorapp/model/daily_information_model.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/widgets/custom_container.dart';
import 'package:doctorapp/widgets/info_label.dart';
import 'package:flutter/material.dart';

class DailyInfoList extends StatelessWidget {
  const DailyInfoList({super.key, required this.dailyInfo});
  final DailyInformationModel dailyInfo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainer(
          cheldreen: [
            InfoLabel(label: 'معلومة طبية', icon: Icons.notifications_sharp),
            SizedBox(height: 10),
            Text(
              AppStyle.normalize('⚫️ ${dailyInfo.medicalInfo1}'),
              style: AppStyle.customText(
                context,
                AppStyle.body,
                FontWeight.w700,
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 5),
            Text(
              AppStyle.normalize('⚫️ ${dailyInfo.medicalInfo2}'),
              style: AppStyle.customText(
                context,
                AppStyle.body,
                FontWeight.w700,
              ),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
        CustomContainer(
          cheldreen: [
            InfoLabel(label: 'دواء اليوم', icon: Icons.medical_services_sharp),
            SizedBox(height: 5),
            Text(
              dailyInfo.drugName,
              textDirection: TextDirection.rtl,
              style: AppStyle.customText(
                context,
                AppStyle.title1,
                FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              AppStyle.normalize('⚫️ ${dailyInfo.indication1}'),
              style: AppStyle.customText(
                context,
                AppStyle.body,
                FontWeight.w700,
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 5),
            Text(
              AppStyle.normalize('⚫️ ${dailyInfo.indication2}'),
              style: AppStyle.customText(
                context,
                AppStyle.body,
                FontWeight.w700,
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 5),
            Text(
              AppStyle.normalize('⚫️ ${dailyInfo.risks}'),
              style: AppStyle.customText(
                context,
                AppStyle.body,
                FontWeight.w700,
              ),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ],
    );
  }
}

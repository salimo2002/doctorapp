import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});
  static const String id = 'personal_info_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الملف الشخصي',
          style: AppStyle.customText(context, 24, FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(decoration: AppStyle.decoratedBackground(context)),
    );
  }
}

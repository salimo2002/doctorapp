import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/widgets/chat_text_field.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});
  static const String id = 'personal_info_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        title: Text(
          'الملف الشخصي',
          style: AppStyle.customText(context, 24, FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: AppStyle.decoratedBackground(context),
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'الايميل ',
                  style: AppStyle.customText(
                    context,
                    AppStyle.title1,
                    FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                ChatTextField(
                  controller: TextEditingController(),
                  hint: 'salimosalim31@gmail.com',
                  focusNode: FocusNode(),
                ),
                SizedBox(height: 10),
                Text(
                  'الاسم ',
                  style: AppStyle.customText(
                    context,
                    AppStyle.title1,
                    FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                ChatTextField(
                  controller: TextEditingController(),
                  hint: 'عمر',
                  focusNode: FocusNode(),
                ),
                SizedBox(height: 10),
                Text(
                  'العمر ',
                  style: AppStyle.customText(
                    context,
                    AppStyle.title1,
                    FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                ChatTextField(
                  controller: TextEditingController(),
                  hint: '19',
                  focusNode: FocusNode(),
                ),
                SizedBox(height: 10),
                Text(
                  'العمل ',
                  style: AppStyle.customText(
                    context,
                    AppStyle.title1,
                    FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                ChatTextField(
                  controller: TextEditingController(),
                  hint: 'طالب',
                  focusNode: FocusNode(),
                ),
                SizedBox(height: 20),
                CustomButton(label: 'حفظ', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

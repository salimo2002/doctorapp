import 'package:flutter/material.dart';
import 'package:doctorapp/utils/app_style.dart';

class UsagePolicyView extends StatelessWidget {
  static const String id = "usage_policy_view";

  const UsagePolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppStyle.decoratedBackground(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: ListView(
              children: [

                /// ✅ العنوان
                Center(
                  child: Text(
                    "سياسة الاستخدام",
                    style: AppStyle.customText(
                      context,
                      AppStyle.h1,
                      FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                _policySection(
                  context,
                  title: "1. طبيعة الخدمة",
                  content:
                      "يوفر تطبيق المستشار الطبي الذكي معلومات "
                      "دوائية عامة لأغراض تثقيفية وإرشادية فقط. "
                      "لا يُعد التطبيق بديلاً عن الاستشارة الطبية "
                      "المباشرة من طبيب أو صيدلي مختص.",
                ),

                _policySection(
                  context,
                  title: "2. مسؤولية الاستخدام",
                  content:
                      "يتحمل المستخدم المسؤولية الكاملة عن "
                      "كيفية استخدام المعلومات المتاحة داخل التطبيق. "
                      "لا يتحمل التطبيق أو القائمون عليه أي مسؤولية "
                      "عن أي أضرار ناتجة عن سوء الاستخدام أو "
                      "تفسير المعلومات بشكل غير صحيح.",
                ),

                _policySection(
                  context,
                  title: "3. الشات بوت الذكي",
                  content:
                      "يعتمد الشات بوت على قاعدة بيانات دوائية "
                      "تم إعدادها بإشراف مختصين، "
                      "ويقوم بالإجابة ضمن نطاق المعلومات المخزنة فقط. "
                      "لا يقدم الشات بوت تشخيصاً طبياً "
                      "ولا يصف علاجاً بديلاً عن الطبيب.",
                ),

                _policySection(
                  context,
                  title: "4. تحديث المعلومات",
                  content:
                      "نسعى لتحديث المعلومات بشكل دوري، "
                      "إلا أن بعض البيانات قد تتغير وفقاً "
                      "للتطورات الطبية أو تحديثات الشركات المصنعة.",
                ),

                _policySection(
                  context,
                  title: "5. خدمة الصيدليات والخرائط",
                  content:
                      "عند استخدام ميزة عرض الصيدليات أو "
                      "الانتقال إلى Google Maps، "
                      "فإنك توافق على استخدام خدمات طرف ثالث. "
                      "التطبيق غير مسؤول عن أي اختلاف "
                      "في بيانات المواقع أو أوقات المناوبة.",
                ),

                _policySection(
                  context,
                  title: "6. قبول الشروط",
                  content:
                      "باستخدامك لهذا التطبيق، فإنك تقر "
                      "بموافقتك على سياسة الاستخدام هذه "
                      "والالتزام بما ورد فيها.",
                ),

                const SizedBox(height: 30),

                Center(
                  child: Text(
                    "نوصي دائماً باستشارة مختص طبي قبل اتخاذ أي قرار علاجي.",
                    textAlign: TextAlign.center,
                    style: AppStyle.customText(
                      context,
                      AppStyle.body,
                      FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _policySection(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.scrim,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: AppStyle.customText(
                context,
                AppStyle.title1,
                FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              textDirection: TextDirection.rtl,
              style: AppStyle.customText(
                context,
                AppStyle.body,
                FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
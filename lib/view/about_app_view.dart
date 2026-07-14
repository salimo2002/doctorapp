import 'package:flutter/material.dart';
import 'package:doctorapp/utils/app_style.dart';

class AboutAppView extends StatelessWidget {
  static const String id = "about_app_view";

  const AboutAppView({super.key});

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

                /// ✅ صورة التطبيق
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/211.png',
                        width: 120,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "المستشار الطبي الذكي",
                        style: AppStyle.customText(
                          context,
                          AppStyle.h1,
                          FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "دليلك الصحي الآمن للمعلومات الدوائية",
                        style: AppStyle.customText(
                          context,
                          AppStyle.body,
                          FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// ✅ وصف التطبيق
                _sectionCard(
                  context,
                  icon: Icons.medication_outlined,
                  title: "قاعدة بيانات دوائية موثوقة",
                  content:
                      "يوفر التطبيق معلومات دقيقة حول الأدوية العامة، "
                      "تشمل دواعي الاستعمال، المخاطر المحتملة، "
                      "وما إذا كان الدواء يتطلب وصفة طبية. "
                      "تمت مراجعة البيانات وإدخالها بإشراف مختصين في المجال الطبي.",
                ),

                const SizedBox(height: 16),

                _sectionCard(
                  context,
                  icon: Icons.smart_toy_outlined,
                  title: "مساعد ذكي للإجابة عن استفساراتك",
                  content:
                      "يمكنك سؤال الشات بوت الذكي عن أي دواء متوفر "
                      "في قاعدة البيانات، وسيقوم بالرد اعتماداً على "
                      "المعلومات الطبية الموثوقة المخزنة داخل التطبيق.",
                ),

                const SizedBox(height: 16),

                _sectionCard(
                  context,
                  icon: Icons.local_pharmacy_outlined,
                  title: "استكشاف الصيدليات",
                  content:
                      "يمكنك تصفح الصيدليات في منطقتك، "
                      "مع إمكانية معرفة الصيدلية المناوبة حالياً، "
                      "والانتقال مباشرة إلى موقعها عبر تطبيق Google Maps.",
                ),

                const SizedBox(height: 30),

                Center(
                  child: Text(
                    "الإصدار 1.0.0",
                    style: AppStyle.customText(
                      context,
                      AppStyle.bodySmall,
                      FontWeight.w400,
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

  Widget _sectionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.scrim,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Icon(icon,
                  color: Theme.of(context).colorScheme.primary),
              const Spacer(),
              Text(
                title,
                style: AppStyle.customText(
                  context,
                  AppStyle.title1,
                  FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
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
    );
  }
}
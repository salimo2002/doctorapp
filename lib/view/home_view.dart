import 'package:doctorapp/theme/theme_provider.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.surfaceTint,
            Theme.of(context).colorScheme.surfaceDim,
            Theme.of(context).colorScheme.surfaceBright,
          ],
        ),
      ),
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
                  Icons.stars,
                  color: Theme.of(context).colorScheme.primary,
                  size: 50,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.scrim,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'معلومة طبية',
                        style: AppStyle.customText(
                          context,
                          22,
                          FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.notifications_sharp, color: Colors.amber),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    '⚫️ لايجب استخدام الايبو بروفين على معدة فارغة',
                    style: AppStyle.customText(context, 16, FontWeight.normal),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(height: 5),
                  Text(
                    '⚫️ يجب الانتباه لعدم تناول جرغات كبيرة من الايبو بروفين',
                    style: AppStyle.customText(context, 16, FontWeight.normal),
                    textDirection: TextDirection.rtl,
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

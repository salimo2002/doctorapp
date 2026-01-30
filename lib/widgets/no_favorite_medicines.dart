
import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class NoFavoriteMedicines extends StatelessWidget {
  const NoFavoriteMedicines({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Icon(
            Icons.favorite_border,
            size: 100,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(height: 10),
          Text(
            'لا توجد أدوية مفضلة حتى الآن',
            style: AppStyle.customText(context, 20, FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'ابدأ باضافة الأدوية التي تود حفظها في المفضلة',
            style: AppStyle.customText(context, 20, FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

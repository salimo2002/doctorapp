import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/widgets/no_favorite_medicines.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyle.decoratedBackground(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: ListView(
          children: [
            Center(
              child: Text(
                'المفضلة',
                style: AppStyle.customText(context, 28, FontWeight.bold),
              ),
            ),

            SizedBox(height: 10),
            NoFavoriteMedicines(),
          ],
        ),
      ),
    );
  }
}

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
        padding: const EdgeInsets.only(left: 12, right: 12, top: 40),
        child: Column(
          children: [
            Center(
              child: Text(
                'المفضلة',
                style: AppStyle.customText(context, 28, FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 5),
                children: [NoFavoriteMedicines()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

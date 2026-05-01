import 'package:doctorapp/theme/theme_provider.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkOrLightMode extends StatelessWidget {
  const DarkOrLightMode({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
      },
      child: Row(
        children: [
          Icon(Icons.arrow_back_ios_outlined),
          Spacer(),
          Text(
            Provider.of<ThemeProvider>(context).currentThemeName == 'dark'
                ? 'الوضع الفاتح'
                : 'الوضع الداكن',
            style: AppStyle.customText(
              context,
              AppStyle.title1,
              FontWeight.bold,
            ),
          ),
          SizedBox(width: 12),
          Icon(
            Provider.of<ThemeProvider>(context).currentIcon,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}

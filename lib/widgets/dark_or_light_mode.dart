import 'package:doctorapp/theme/theme.dart';
import 'package:doctorapp/theme/theme_provider.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkOrLightMode extends StatefulWidget {
  const DarkOrLightMode({super.key});

  @override
  State<DarkOrLightMode> createState() => _DarkOrLightModeState();
}

class _DarkOrLightModeState extends State<DarkOrLightMode> {
  late bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    isDarkMode = Provider.of<ThemeProvider>(context).currentTheme == darkMode;
    return InkWell(
      onTap: () {
        setState(() {
          isDarkMode = !isDarkMode;
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
        });
      },
      child: Row(
        children: [
          Icon(
            isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: Colors.amber,
            size: 30,
          ),
          Spacer(),
          Text(
            isDarkMode ? 'الوضع الداكن' : 'الوضع الفاتح',
            style: AppStyle.customText(context, 20, FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

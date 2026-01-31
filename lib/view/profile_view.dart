import 'package:doctorapp/theme/theme_provider.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: AppStyle.decoratedBackground(context),
          child: Switch(
            value: isDark,
            onChanged: (value) {
              setState(() {
                isDark = value;
                Provider.of<ThemeProvider>(
                  context,
                  listen: false,
                ).toggleTheme();
              });
            },
          ),
        ),
        
      ],
    );
  }
}

import 'package:doctorapp/theme/theme_provider.dart';
import 'package:doctorapp/view/chat_view.dart';
import 'package:doctorapp/view/favorite_view.dart';
import 'package:doctorapp/view/home_view.dart';
import 'package:doctorapp/view/hospitals_view.dart';
import 'package:doctorapp/view/profile_view.dart';
import 'package:doctorapp/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const DoctorApp(),
    ),
  );
}

class DoctorApp extends StatefulWidget {
  const DoctorApp({super.key});

  @override
  State<DoctorApp> createState() => _DoctorAppState();
}

class _DoctorAppState extends State<DoctorApp> {
  List<Widget> pages = [
    HomeView(),
    ChatView(),
    HospitalsView(),
    FavoriteView(),
    ProfileView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: CustomNavBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        body: IndexedStack(index: currentIndex, children: pages),
      ),
    );
  }
}

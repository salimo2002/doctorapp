import 'package:doctorapp/view/chat_view.dart';
import 'package:doctorapp/view/favorite_view.dart';
import 'package:doctorapp/view/home_view.dart';
import 'package:doctorapp/view/pharmacies_view.dart';
import 'package:doctorapp/view/profile_view.dart';
import 'package:doctorapp/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainViews extends StatefulWidget {
  const MainViews({super.key});
  static String id = 'main_views';
  @override
  State<MainViews> createState() => _MainViewsState();
}

class _MainViewsState extends State<MainViews> {
  List<Widget> pages = [
    ProfileView(),
    FavoriteView(),
    PharmaciesView(),
    ChatView(),
    HomeView(),
  ];
  int currentIndex = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: IndexedStack(index: currentIndex, children: pages),
    );
  }
}

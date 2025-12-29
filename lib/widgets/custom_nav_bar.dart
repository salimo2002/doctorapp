import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });
  final Function(int) onTap;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      showUnselectedLabels: true,
      elevation: 0,
      iconSize: 28,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Theme.of(context).colorScheme.surfaceBright,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: 'محادثة',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_hospital_outlined),
          label: 'الصيدليات',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'المفضلة',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: 'حسابي',
        ),
      ],
    );
  }
}

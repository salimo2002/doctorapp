import 'package:doctorapp/widgets/category_container.dart';
import 'package:flutter/material.dart';

class SmallCategories extends StatefulWidget {
  const SmallCategories({super.key});

  @override
  State<SmallCategories> createState() => _SmallCategoriesState();
}

class _SmallCategoriesState extends State<SmallCategories> {
  bool card1 = true;
  bool card2 = false;
  bool card3 = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        CategoryContainer(
          icon: Icons.link,
          label: 'جميع الادوية',
          isSelected: card1,
          onTap: () {
            setState(() {
              card1 = true;
              card2 = false;
              card3 = false;
            });
          },
        ),
        CategoryContainer(
          icon: Icons.flag,
          label: 'الادوية الاكثر مبيعا',
          isSelected: card2,
          onTap: () {
            setState(() {
              card1 = false;
              card2 = true;
              card3 = false;
            });
          },
        ),
        CategoryContainer(
          icon: Icons.new_label_sharp,
          label: 'ادوية جديدة',
          isSelected: card3,
          onTap: () {
            setState(() {
              card1 = false;
              card2 = false;
              card3 = true;
            });
          },
        ),
      ],
    );
  }
}

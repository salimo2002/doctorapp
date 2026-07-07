import 'package:doctorapp/widgets/category_container.dart';
import 'package:flutter/material.dart';

class SmallCategories extends StatefulWidget {
  const SmallCategories({
    super.key,
    required this.label1,
    required this.label2,
    required this.icon1,
    required this.icon2,
  });
  final String label1;
  final String label2;
  final IconData icon1;
  final IconData icon2;
  @override
  State<SmallCategories> createState() => _SmallCategoriesState();
}

class _SmallCategoriesState extends State<SmallCategories> {
  bool card1 = true;
  bool card2 = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoryContainer(
          icon: widget.icon1,
          label: widget.label1,
          isSelected: card1,
          onTap: () {
            setState(() {
              card1 = true;
              card2 = false;
            });
          },
        ),
        CategoryContainer(
          icon: widget.icon2,
          label: widget.label2,
          isSelected: card2,
          onTap: () {
            setState(() {
              card1 = false;
              card2 = true;
            });
          },
        ),
      ],
    );
  }
}

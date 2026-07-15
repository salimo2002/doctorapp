import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class SmallCategories extends StatefulWidget {
  const SmallCategories({super.key, required this.onChanged});

  final Function(bool isAllDrugs) onChanged;

  @override
  State<SmallCategories> createState() => _SmallCategoriesState();
}

class _SmallCategoriesState extends State<SmallCategories> {
  bool isAllSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isAllSelected = true;
                });
                widget.onChanged(true);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 50,
                decoration: BoxDecoration(
                  color: isAllSelected
                      ? Theme.of(context).colorScheme.inverseSurface
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.link,
                      size: 20,
                      color: !isAllSelected
                          ? Colors.black
                          : Theme.of(context).colorScheme.tertiary,
                    ),
                    SizedBox(width: 6),
                    Text(
                      "جميع الأدوية",
                      style: AppStyle.containerText(
                        context,
                        AppStyle.bodySmall,
                        FontWeight.bold,
                        !isAllSelected
                            ? Colors.black
                            : Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // الادوية المفقودة
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isAllSelected = false;
                });
                widget.onChanged(false);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 50,
                decoration: BoxDecoration(
                  color: !isAllSelected
                      ? Theme.of(context).colorScheme.inverseSurface
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.visibility_off,
                      size: 20,
                      color: !isAllSelected
                          ? Theme.of(context).colorScheme.tertiary
                          : Colors.black,
                    ),
                    SizedBox(width: 6),
                    Text(
                      "الأدوية المفقودة",
                      style: AppStyle.containerText(
                        context,
                        AppStyle.bodySmall,
                        FontWeight.bold,
                        !isAllSelected
                            ? Theme.of(context).colorScheme.tertiary
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/widgets/open_or_close_pharmasy.dart';
import 'package:flutter/material.dart';

class PharmacyLabel extends StatelessWidget {
  const PharmacyLabel({
    super.key,
    required this.pharmacyLabel,
    required this.pharmacyLocation, required this.isOpen,
  });
  final String pharmacyLabel;
  final VoidCallback pharmacyLocation;
  final bool isOpen;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: pharmacyLocation,
          icon: Icon(
            Icons.location_on_outlined,
            size: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        OpenOrClosePharmasy(isOpen: isOpen),
        Text(
          pharmacyLabel,
          style: AppStyle.customText(context, 20, FontWeight.bold),
        ),
      ],
    );
  }
}

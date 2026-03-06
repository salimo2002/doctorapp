import 'package:doctorapp/widgets/custom_container.dart';
import 'package:doctorapp/widgets/pharmacy_details.dart';
import 'package:doctorapp/widgets/pharmacy_label.dart';
import 'package:flutter/material.dart';

class PharmacyContainer extends StatelessWidget {
  const PharmacyContainer({
    super.key,
    required this.pharmacyLabel,
    required this.isOpen,
    required this.pharmacyLocation,
    required this.location,
    required this.address,
    required this.workingHours,
    required this.phoneNumber,
  });
  final String pharmacyLabel;
  final bool isOpen;
  final VoidCallback pharmacyLocation;
  final String location;
  final String address;
  final String workingHours;
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      cheldreen: [
        PharmacyLabel(
          pharmacyLabel: pharmacyLabel,
          pharmacyLocation: () {},
          isOpen: isOpen,
        ),
        PharmacyDetails(iconData: Icons.location_on, title: location),
        PharmacyDetails(iconData: Icons.timer, title: workingHours),
        PharmacyDetails(iconData: Icons.phone_android, title: phoneNumber),
      ],
    );
  }
}

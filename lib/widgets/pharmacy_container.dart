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
          pharmacyLabel: 'صيدلية اليرموك',
          pharmacyLocation: () {},
          isOpen: isOpen,
        ),
        PharmacyDetails(
          iconData: Icons.location_on,
          title: 'شارع الحضارة - مقابل مجمع اليرموك',
        ),
        PharmacyDetails(
          iconData: Icons.timer,
          title: 'من الساعة 8:00 صباحا حتى 10:00 مساء',
        ),
        PharmacyDetails(iconData: Icons.phone_android, title: '0988818024'),
      ],
    );
  }
}

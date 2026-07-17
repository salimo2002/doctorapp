import 'package:doctorapp/model/pharmacy_model.dart';
import 'package:flutter/material.dart';

bool isOpenNow(PharmacyModel pharmacy) {
    if (pharmacy.openingTime == null || pharmacy.closingTime == null) {
      return false;
    }
    final now = TimeOfDay.now();
    final nowMinutes = now.hour * 60 + now.minute;
    final openParts = pharmacy.openingTime!.split(':');
    final openMinutes = int.parse(openParts[0]) * 60 + int.parse(openParts[1]);
    final closeParts = pharmacy.closingTime!.split(':');
    final closeMinutes =
        int.parse(closeParts[0]) * 60 + int.parse(closeParts[1]);
    return nowMinutes >= openMinutes && nowMinutes <= closeMinutes;
  }

  String formatWorkingHours(String? open, String? close) {
    if (open == null || close == null) return 'غير محدد';

    final openFormatted = open.substring(0, 5);
    final closeFormatted = close.substring(0, 5);
    return 'من $openFormatted حتى $closeFormatted';
  }
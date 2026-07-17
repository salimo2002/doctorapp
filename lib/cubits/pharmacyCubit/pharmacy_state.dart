import '../../model/pharmacy_model.dart';
import '../../model/on_duty_model.dart';

abstract class PharmacyState {}

class PharmacyInitial extends PharmacyState {}

class PharmacyLoading extends PharmacyState {}

class PharmacyLoaded extends PharmacyState {
  final List<PharmacyModel> allPharmacies;
  final List<OnDutyModel> onDutyPharmacies;

  PharmacyLoaded({
    required this.allPharmacies,
    required this.onDutyPharmacies,
  });
}

class PharmacyError extends PharmacyState {}
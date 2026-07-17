import 'package:doctorapp/model/on_duty_model.dart';
import 'package:doctorapp/model/pharmacy_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/pharmacy_service.dart';
import 'pharmacy_state.dart';

enum PharmacyFilter { all, onDuty }

class PharmacyCubit extends Cubit<PharmacyState> {
  PharmacyCubit() : super(PharmacyInitial());

  List<PharmacyModel> _allPharmacies = [];
  List<OnDutyModel> _onDutyPharmacies = [];

  PharmacyFilter _currentFilter = PharmacyFilter.all;

  Future<void> loadPharmacies() async {
    emit(PharmacyLoading());

    try {
      _allPharmacies =
          await PharmacyService.getAllPharmacies();

      _onDutyPharmacies =
          await PharmacyService.getTodayOnDuty();

      emit(PharmacyLoaded(
        allPharmacies: _allPharmacies,
        onDutyPharmacies: _onDutyPharmacies,
      ));
    } catch (e) {
      emit(PharmacyError());
    }
  }

  void changeFilter(PharmacyFilter filter) {
    _currentFilter = filter;

    if (state is PharmacyLoaded) {
      emit(PharmacyLoaded(
        allPharmacies: _allPharmacies,
        onDutyPharmacies: _onDutyPharmacies,
      ));
    }
  }

  PharmacyFilter get currentFilter => _currentFilter;
}
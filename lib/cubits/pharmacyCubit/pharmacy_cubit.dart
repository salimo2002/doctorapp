import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/pharmacy_model.dart';
import '../../model/on_duty_model.dart';
import '../../services/pharmacy_service.dart';
import 'pharmacy_state.dart';

enum PharmacyFilter { all, onDuty }

class PharmacyCubit extends Cubit<PharmacyState> {
  PharmacyCubit() : super(PharmacyInitial());

  List<PharmacyModel> _allPharmacies = [];
  List<OnDutyModel> _onDutyPharmacies = [];

  PharmacyFilter _currentFilter = PharmacyFilter.all;
  String _searchQuery = '';

  PharmacyFilter get currentFilter => _currentFilter;

  Future<void> loadPharmacies() async {
    emit(PharmacyLoading());

    try {
      _allPharmacies = await PharmacyService.getAllPharmacies();
      _onDutyPharmacies = await PharmacyService.getTodayOnDuty();

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
    _emitCurrentState();
  }

  void searchPharmacy(String query) {
    _searchQuery = query.trim().toLowerCase();
    _emitCurrentState();
  }

  void _emitCurrentState() {
    emit(PharmacyLoaded(
      allPharmacies: _allPharmacies,
      onDutyPharmacies: _onDutyPharmacies,
    ));
  }

  List<PharmacyModel> get filteredAllPharmacies {
    if (_searchQuery.isEmpty) return _allPharmacies;

    return _allPharmacies.where((pharmacy) {
      return pharmacy.name.toLowerCase().contains(_searchQuery) ||
          pharmacy.address.toLowerCase().contains(_searchQuery);
    }).toList();
  }

  List<OnDutyModel> get filteredOnDutyPharmacies {
    if (_searchQuery.isEmpty) return _onDutyPharmacies;

    return _onDutyPharmacies.where((onDuty) {
      return onDuty.pharmacy.name
              .toLowerCase()
              .contains(_searchQuery) ||
          onDuty.pharmacy.address
              .toLowerCase()
              .contains(_searchQuery);
    }).toList();
  }
}
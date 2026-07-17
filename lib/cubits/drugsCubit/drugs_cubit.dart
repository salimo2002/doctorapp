import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/drugs_model.dart';
import '../../services/drug_services.dart';
import 'drugs_state.dart';

enum DrugsFilter { all, missing }

class DrugsCubit extends Cubit<DrugsState> {
  DrugsCubit() : super(DrugsInit());

  List<DrugsModel> drugs = [];
  DrugsFilter _currentFilter = DrugsFilter.all;
  String _searchQuery = '';

  Future<void> getDrugs() async {
    emit(DrugsLoading());
    try {
      drugs = await DrugServices.getDrugs();
      emit(DrugsSuccess(drugs: _applyFilters()));
    } catch (e) {
      emit(DrugsError());
    }
  }

  void changeFilter(DrugsFilter filter) {
    _currentFilter = filter;
    emit(DrugsSuccess(drugs: _applyFilters()));
  }

  void searchDrug(String query) {
    _searchQuery = query.trim().toLowerCase();
    emit(DrugsSuccess(drugs: _applyFilters()));
  }

  List<DrugsModel> _applyFilters() {
    List<DrugsModel> filtered = drugs;
    if (_currentFilter == DrugsFilter.missing) {
      filtered = filtered.where((d) => d.isRare).toList();
    }
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((drug) {
        return drug.name.toLowerCase().contains(_searchQuery) ||
            drug.indications.toLowerCase().contains(_searchQuery);
      }).toList();
    }

    return filtered;
  }
}

import 'package:doctorapp/cubits/drugsCubit/drugs_state.dart';
import 'package:doctorapp/model/drugs_model.dart';
import 'package:doctorapp/services/drug_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
enum DrugsFilter { all, missing }

class DrugsCubit extends Cubit<DrugsState> {
  DrugsCubit() : super(DrugsInit());

  List<DrugsModel> drugs = [];
  DrugsFilter _currentFilter = DrugsFilter.all;

  Future<void> getDrugs() async {
    emit(DrugsLoading());
    try {
      drugs = await DrugServices.getDrugs();
      emit(DrugsSuccess(drugs: _applyFilter()));
    } catch (e) {
      emit(DrugsError());
    }
  }

  void changeFilter(DrugsFilter filter) {
    _currentFilter = filter;
    emit(DrugsSuccess(drugs: _applyFilter()));
  }

  List<DrugsModel> _applyFilter() {
    switch (_currentFilter) {
      case DrugsFilter.missing:
        return drugs.where((d) => d.isRare).toList();
      case DrugsFilter.all:
      return drugs;
    }
  }
}
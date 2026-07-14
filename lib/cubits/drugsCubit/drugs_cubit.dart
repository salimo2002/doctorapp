import 'package:doctorapp/cubits/drugsCubit/drugs_state.dart';
import 'package:doctorapp/model/drugs_model.dart';
import 'package:doctorapp/services/drug_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrugsCubit extends Cubit<DrugsState> {
  DrugsCubit() : super(DrugsInit());
  List<DrugsModel> drugs = [];
  Future<void> getDrugs() async {
    emit(DrugsLoading());
    try {
      drugs = await DrugServices.getDrugs();
      emit(DrugsSuccess(drugs: drugs));
    } catch (e) {
      emit(DrugsError());
    }
  }
}

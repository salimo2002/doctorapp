import 'package:doctorapp/cubits/drugsCubit/drugs_state.dart';
import 'package:doctorapp/services/drug_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrugsCubit extends Cubit<DrugsState> {
  DrugsCubit() : super(DrugsInit());

  Future<void> getDrugs() async {
    emit(DrugsLoading());
    try {
      final drugs = await DrugServices.getDrugs();
      emit(DrugsSuccess(drugs: drugs));
    } catch (e) {
      emit(DrugsError());
    }
  }
}

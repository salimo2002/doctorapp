import 'package:doctorapp/cubits/dailyInformationCubit/daily_info_state.dart';
import 'package:doctorapp/services/daily_info_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyInfoCubit extends Cubit<DailyInfoState> {
  DailyInfoCubit() : super(DailyInfoInit());
  Future<void> getDailyInfo() async {
    emit(DailyInfoLoading());
    try {
      final dailyInfo = await DailyInformationService.getTodayInformation();
      emit(DailyInfoSuccess(dailyInfo: dailyInfo));
    } catch (e) {
      emit(DailyInfoError());
    }
  }
}

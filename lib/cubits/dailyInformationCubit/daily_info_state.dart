import 'package:doctorapp/model/daily_information_model.dart';

abstract class DailyInfoState {}

class DailyInfoSuccess extends DailyInfoState {
  final DailyInformationModel dailyInfo;
  DailyInfoSuccess({required this.dailyInfo});
}

class DailyInfoLoading extends DailyInfoState {}

class DailyInfoError extends DailyInfoState {}

class DailyInfoInit extends DailyInfoState {}

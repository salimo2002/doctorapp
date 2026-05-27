import 'package:doctorapp/model/drugs_model.dart';

abstract class DrugsState {}

class DrugsInit extends DrugsState {}

class DrugsLoading extends DrugsState {}

class DrugsSuccess extends DrugsState {
  final List<DrugsModel> drugs;
  DrugsSuccess({required this.drugs});
}

class DrugsError extends DrugsState {}

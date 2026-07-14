import 'package:doctorapp/model/app_users.dart';


abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final AppUsers user;

  ProfileLoaded(this.user);
}

class ProfileSuccess extends ProfileState {
  final AppUsers user;
  final String message;

  ProfileSuccess(this.user, this.message);
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}
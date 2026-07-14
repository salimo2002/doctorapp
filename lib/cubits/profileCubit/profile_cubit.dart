import 'package:doctorapp/model/app_users.dart';
import 'package:doctorapp/services/profile_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  AppUsers? currentUser;

  Future<void> loadUser(int userId) async {
    emit(ProfileLoading());
    try {
      final user = await ProfileService.getUser(userId);
      currentUser = user;
      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError("فشل تحميل بيانات المستخدم"));
    }
  }

  Future<void> updateProfile({
    required int userId,
    String? fullName,
    int? age,
    String? job,
  }) async {
    emit(ProfileLoading());
    try {
      final updatedUser = await ProfileService.updateUser(
        userId: userId,
        fullName: fullName,
        age: age,
        job: job,
      );
      currentUser = updatedUser;
      emit(ProfileSuccess(updatedUser, "تم تحديث البيانات بنجاح"));
    } catch (e) {
      emit(ProfileError("حدث خطأ أثناء تحديث البيانات"));
    }
  }
}

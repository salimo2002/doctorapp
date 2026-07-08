import 'package:doctorapp/model/user_model.dart';
import 'package:doctorapp/services/app_auth_service.dart';
import 'package:doctorapp/services/otp_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInit());
  UserModel? currentUser;

  Future<void> login({required String phone, required String password}) async {
    emit(AuthLoading());
    try {
      final user = await AppAuthService.login(
        phoneNumber: phone,
        password: password,
      );
      currentUser = user;
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register({
    required String phone,
    required String password,
    required String fullName,
    int? age,
    String? job,
  }) async {
    emit(AuthLoading());
    try {
      final user = await AppAuthService.register(
        phoneNumber: phone,
        password: password,
        fullName: fullName,
        age: age,
        job: job,
      );
      currentUser = user;
      final sent = await OtpService.sendOtp(phone);
      if (!sent) throw Exception('فشل إرسال رمز التحقق عبر واتساب');
      emit(AuthOtpSent(phone));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> verifyOtpAndActivate({
    required String phone,
    required String code,
  }) async {
    emit(AuthLoading());
    try {
      if (!OtpService.verifyOtp(code)) {
        throw Exception('رمز التحقق غير صحيح');
      }
      await AppAuthService.verifyUserPhone(phone);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}

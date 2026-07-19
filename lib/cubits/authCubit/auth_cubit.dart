import 'package:doctorapp/model/app_users.dart';
import 'package:doctorapp/services/app_auth_service.dart';
import 'package:doctorapp/services/otp_service.dart';
import 'package:doctorapp/utils/app_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInit());

  AppUsers? currentUser;

  Future<void> login({
    required String phone,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      final user = await AppAuthService.login(
        phoneNumber: phone,
        password: password,
      );

      if (user == null) {
        throw Exception('حدث خطأ أثناء تسجيل الدخول');
      }

      currentUser = user;

      if (user.isWhatsappVerified == false) {
        final sent = await OtpService.sendOtp(phone);
        if (!sent) {
          throw Exception('فشل إرسال رمز التحقق');
        }
        emit(AuthOtpSent(phone));
      } else {
        await AppPreferences.setLoggedIn(true);
        await AppPreferences.saveUserId(user.id);
        emit(AuthSuccess());
      }
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
      if (!sent) {
        throw Exception('فشل إرسال رمز التحقق');
      }

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
      final isValid = OtpService.verifyOtp(code);

      if (!isValid) {
        emit(AuthFailure('رمز التحقق غير صحيح'));
        return;
      }

      await AppAuthService.verifyUserPhone(phone);

      if (currentUser != null) {
        currentUser =
            currentUser!.copyWith(isWhatsappVerified: true);

        await AppPreferences.setLoggedIn(true);
        await AppPreferences.saveUserId(currentUser!.id);
      }

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> loadUserFromStorage(int userId) async {
    final user = await AppAuthService.getUserById(userId);
    currentUser = user;
  }
}
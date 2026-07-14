import 'package:doctorapp/cubits/authCubit/auth_cubit.dart';
import 'package:doctorapp/cubits/authCubit/auth_state.dart';
import 'package:doctorapp/services/otp_service.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/view/main_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpView extends StatefulWidget {
  final String phone;

  const OtpView({super.key, required this.phone});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final TextEditingController code = TextEditingController();

  @override
  void dispose() {
    code.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppStyle.decoratedBackground(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const MainViews()),
                    (route) => false,
                  );
                }
                if (state is AuthFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text(
                                state.message,
                                textAlign: TextAlign.center,
                                style: AppStyle.containerText(
                                  context,
                                  AppStyle.bodySmall,
                                  FontWeight.bold,
                                  Colors.white,
                                ),
                              ),
                              backgroundColor: Colors.red,
                            ),);
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/211.png', width: 150),
                    SizedBox(height: 10),
                    Text(
                      "التحقق من رقم الهاتف",
                      style: AppStyle.customText(
                        context,
                        AppStyle.h1,
                        FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "أدخل رمز التحقق المرسل إلى\n${widget.phone}",
                      textAlign: TextAlign.center,
                      style: AppStyle.customText(
                        context,
                        AppStyle.body,
                        FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      controller: code,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 6,
                      style: AppStyle.customText(
                        context,
                        AppStyle.h3,
                        FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: "رمز التحقق",
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.scrim,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: state is AuthLoading
                            ? null
                            : () {
                                context.read<AuthCubit>().verifyOtpAndActivate(
                                  phone: widget.phone,
                                  code: code.text.trim(),
                                );
                              },
                        child: state is AuthLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "تحقق",
                                style: AppStyle.containerText(
                                  context,
                                  AppStyle.title1,
                                  FontWeight.bold,
                                  Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: state is AuthLoading
                          ? null
                          : () async {
                              await OtpService.sendOtp(widget.phone);
                            },
                      child: state is AuthLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              "إعادة إرسال الرمز",
                              style: AppStyle.customText(
                                context,
                                AppStyle.bodySmall,
                                FontWeight.w500,
                              ),
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

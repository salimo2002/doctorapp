import 'package:doctorapp/cubits/authCubit/auth_cubit.dart';
import 'package:doctorapp/cubits/authCubit/auth_state.dart';
import 'package:doctorapp/utils/app_preferences.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/view/main_views.dart';
import 'package:doctorapp/view/otp_view.dart';
import 'package:doctorapp/view/register_view.dart';
import 'package:doctorapp/widgets/chat_text_field.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:doctorapp/widgets/text_field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  static String id = 'log_in_view';

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late FocusNode phoneFocus;
  late FocusNode passwordFocus;
  late AuthCubit authCubit;
  late GlobalKey<FormState> globalKey;

  @override
  void initState() {
    super.initState();
    globalKey = GlobalKey<FormState>();
    authCubit = context.read<AuthCubit>();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    phoneFocus = FocusNode();
    passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    phoneFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: AppStyle.decoratedBackground(context),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * .05),
                    Image.asset(AppStyle.appIcon, width: 200),
                    const SizedBox(height: 10),
                    Text(
                      'المستشار الذكي',
                      style: AppStyle.containerText(
                        context,
                        AppStyle.h2,
                        FontWeight.bold,
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      'مرحبا بعودتك',
                      style: AppStyle.customText(
                        context,
                        AppStyle.h3,
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      'سجل دخولك للوصول الى ادويتك',
                      style: AppStyle.customText(
                        context,
                        AppStyle.h3,
                        FontWeight.normal,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const TextFieldLabel(label: 'رقم الهاتف'),

                    const SizedBox(height: 5),

                    ChatTextField(
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'رقم الهاتف مطلوب';
                        }
                        return null;
                      },
                      inputType: TextInputType.number,
                      controller: phoneController,
                      focusNode: phoneFocus,
                      hint: 'ادخل رقم الهاتف',
                      suffixIcon: Icon(
                        Icons.phone_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const TextFieldLabel(label: 'كلمة المرور'),

                    const SizedBox(height: 5),

                    ChatTextField(
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'كلمة المرور مطلوبة';
                        }
                        return null;
                      },
                      obs: true,
                      controller: passwordController,
                      focusNode: passwordFocus,
                      hint: 'ادخل كلمة المرور',
                      suffixIcon: Icon(
                        Icons.lock_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'نسيت كلمة المرور؟',
                            style: AppStyle.containerText(
                              context,
                              AppStyle.title2,
                              FontWeight.bold,
                              Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),

                    const SizedBox(height: 20),

                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) async {
                        if (state is AuthSuccess) {
                          await AppPreferences.setLoggedIn(true);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 1),
                              content: Text(
                                'تم تسجيل الدخول بنجاح',
                                textAlign: TextAlign.center,
                                style: AppStyle.containerText(
                                  context,
                                  AppStyle.bodySmall,
                                  FontWeight.bold,
                                  Colors.white,
                                ),
                              ),
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                            ),
                          );

                          Navigator.pushReplacementNamed(context, MainViews.id);
                        }

                        if (state is AuthOtpSent) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text(
                                'تم إرسال رمز التحقق إلى واتساب',
                                textAlign: TextAlign.center,
                                style: AppStyle.containerText(
                                  context,
                                  AppStyle.bodySmall,
                                  FontWeight.bold,
                                  Colors.white,
                                ),
                              ),
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                            ),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => OtpView(phone: state.phone),
                            ),
                          );
                        }

                        if (state is AuthFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
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
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.primary,
                          );
                        }
                        return CustomButton(
                          label: 'تسجيل الدخول',
                          onPressed: () {
                            if (globalKey.currentState!.validate()) {
                              authCubit.login(
                                phone: phoneController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                            }
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterView.id);
                          },
                          child: Text(
                            'سجل الان',
                            style: AppStyle.containerText(
                              context,
                              18,
                              FontWeight.bold,
                              Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),

                        const SizedBox(width: 5),

                        Text(
                          'ليس لديك حساب؟',
                          style: AppStyle.customText(
                            context,
                            18,
                            FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

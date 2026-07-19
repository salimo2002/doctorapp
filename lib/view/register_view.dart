import 'dart:math';
import 'package:doctorapp/cubits/authCubit/auth_cubit.dart';
import 'package:doctorapp/cubits/authCubit/auth_state.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/view/otp_view.dart';
import 'package:doctorapp/widgets/chat_text_field.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:doctorapp/widgets/text_field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String id = 'register_view';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String generateOtp() {
    final random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }

  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController userName;
  late FocusNode phoneFocus;
  late FocusNode passwordFocus;
  late FocusNode confirmPasswordFocus;
  late FocusNode userNameFocusNode;
  late GlobalKey<FormState> globalKey;
  late AuthCubit authCubit;
  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    userName = TextEditingController();
    phoneFocus = FocusNode();
    passwordFocus = FocusNode();
    confirmPasswordFocus = FocusNode();
    userNameFocusNode = FocusNode();
    globalKey = GlobalKey<FormState>();
    authCubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    userName.dispose();
    phoneFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    userNameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Scaffold(
        body: Container(
          decoration: AppStyle.decoratedBackground(context),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppStyle.appIcon, width: 200),
                    Text(
                      'المستشار الذكي',
                      style: AppStyle.containerText(
                        context,
                        AppStyle.h2,
                        FontWeight.bold,
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'انشاء حساب جديد',
                      style: AppStyle.customText(
                        context,
                        AppStyle.h3,
                        FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'انشئ حسابك واستمتع بخدماتنا',
                      style: AppStyle.customText(
                        context,
                        AppStyle.h3,
                        FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFieldLabel(label: 'الاسم الكامل'),
                    SizedBox(height: 5),
                    ChatTextField(
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'الاسم الكامل مطلوب';
                        }
                        return null;
                      },
                      controller: userName,
                      focusNode: userNameFocusNode,
                      hint: 'ادخل الاسم الكامل',
                      suffixIcon: Icon(
                        Icons.person_outline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFieldLabel(label: 'رقم الهاتف'),
                    SizedBox(height: 5),
                    ChatTextField(
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'رقم الهاتف مطلوب';
                        }
                        return null;
                      },
                      controller: phoneController,
                      focusNode: phoneFocus,
                      hint: 'ادخل رقم الهاتف',
                      inputType: TextInputType.number,
                      suffixIcon: Icon(
                        Icons.email_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFieldLabel(label: 'كلمة المرور'),
                    SizedBox(height: 5),
                    ChatTextField(
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'كلمة المرور مطلوبة';
                        }
                        return null;
                      },
                      controller: passwordController,
                      focusNode: passwordFocus,
                      hint: 'ادخل كلمة المرور',
                      suffixIcon: Icon(
                        Icons.lock_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFieldLabel(label: 'تأكيد كلمة المرور'),
                    SizedBox(height: 5),
                    ChatTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'تأكيد كلمة المرور مطلوب';
                        }
                        if (value != passwordController.text) {
                          return 'كلمتا المرور غير متطابقتين';
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                      focusNode: confirmPasswordFocus,
                      hint: 'أعد ادخال كلمة المرور',
                      suffixIcon: Icon(
                        Icons.lock_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 20),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthOtpSent) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => OtpView(phone: state.phone),
                            ),
                          );
                        } else if (state is AuthFailure) {
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
                          label: 'انشاء حساب',
                          onPressed: () {
                            if (globalKey.currentState!.validate()) {
                              context.read<AuthCubit>().register(
                                phone: phoneController.text,
                                password: passwordController.text,
                                fullName: userName.text,
                              );
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'تسجيل الدخول',
                            style: AppStyle.containerText(
                              context,
                              18,
                              FontWeight.bold,
                              Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'لديك حساب؟',
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

import 'package:doctorapp/cubits/authCubit/auth_cubit.dart';
import 'package:doctorapp/cubits/authCubit/auth_state.dart';
import 'package:doctorapp/utils/app_style.dart';
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
    globalKey = GlobalKey<FormState>();
    authCubit = context.read<AuthCubit>();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    phoneFocus = FocusNode();
    passwordFocus = FocusNode();
    super.initState();
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
            padding: EdgeInsets.only(left: 24, right: 24),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * .08),
                    Image.asset('assets/images/211.png', width: 150),
                    SizedBox(height: 10),
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
                      'مرحبا بعودتك',
                      style: AppStyle.customText(
                        context,
                        AppStyle.h3,
                        FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'سجل دخولك للوصول الى ادويتك',
                      style: AppStyle.customText(
                        context,
                        AppStyle.h3,
                        FontWeight.normal,
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
                      inputType: TextInputType.number,
                      controller: phoneController,
                      focusNode: phoneFocus,
                      hint: 'ادخل رقم الهاتف',
                      suffixIcon: Icon(
                        Icons.phone_rounded,
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
                      obs: true,
                      controller: passwordController,
                      focusNode: passwordFocus,
                      hint: 'ادخل كلمة المرور',
                      suffixIcon: Icon(
                        Icons.lock_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 5),
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
                        SizedBox(width: 5),
                      ],
                    ),
                    SizedBox(height: 20),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('تم تسجيل الدخوووووووووول')),
                          );
                        }
                        if (state is AuthFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.primary,
                          );
                        } else {
                          return CustomButton(
                            label: 'تسجيل الدخول',
                            onPressed: () {
                              if (globalKey.currentState!.validate()) {
                                authCubit.login(
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                          );
                        }
                      },
                    ),
                    SizedBox(height: 20),
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
                        SizedBox(width: 5),
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

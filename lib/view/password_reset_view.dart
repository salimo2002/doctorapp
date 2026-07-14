import 'package:doctorapp/cubits/authCubit/auth_state.dart';
import 'package:doctorapp/cubits/profileCubit/profile_cubit.dart';
import 'package:doctorapp/cubits/profileCubit/profile_state.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/view/home_view.dart';
import 'package:doctorapp/view/main_views.dart';
import 'package:doctorapp/widgets/chat_text_field.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordResetView extends StatefulWidget {
  const PasswordResetView({super.key});
  static String id = 'PasswordResetView';

  @override
  State<PasswordResetView> createState() => _PasswordResetViewState();
}

class _PasswordResetViewState extends State<PasswordResetView> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late FocusNode passwordFocus;
  late FocusNode confirmPasswordFocus;
  late GlobalKey<FormState> globalKey;
  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    passwordFocus = FocusNode();
    confirmPasswordFocus = FocusNode();
    globalKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        title: Text(
          'تغيير كلمة المرور',
          style: AppStyle.customText(context, 24, FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: globalKey,
        child: Container(
          decoration: AppStyle.decoratedBackground(context),
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'كلمة المرور الجديدة',
                  style: AppStyle.customText(
                    context,
                    AppStyle.title1,
                    FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                ChatTextField(
                  controller: passwordController,
                  hint: '',
                  focusNode: passwordFocus,
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'اكتب كلمة المرور الجديدة ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'تأكيد كلمة المرور',
                  style: AppStyle.customText(
                    context,
                    AppStyle.title1,
                    FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                ChatTextField(
                  controller: confirmPasswordController,
                  hint: '',
                  focusNode: confirmPasswordFocus,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'تأكيد كلمة المرور مطلوب';
                    }
                    if (value != passwordController.text) {
                      return 'كلمتا المرور غير متطابقتين';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    if (state is ProfileSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(
                            'تم تغيير كلمة المرور',
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
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        MainViews.id,
                        (route) => false,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      );
                    } else {
                      return CustomButton(
                        label: 'حفظ',
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            context.read<ProfileCubit>().changePassword(
                              userId: context
                                  .read<ProfileCubit>()
                                  .currentUser!
                                  .id,
                              newPassword: passwordController.text,
                            );
                          }
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

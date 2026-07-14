import 'package:doctorapp/cubits/authCubit/auth_cubit.dart';
import 'package:doctorapp/cubits/profileCubit/profile_cubit.dart';
import 'package:doctorapp/cubits/profileCubit/profile_state.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/widgets/chat_text_field.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoView extends StatefulWidget {
  const PersonalInfoView({super.key});
  static const String id = 'personal_info_view';

  @override
  State<PersonalInfoView> createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  late TextEditingController name;
  late FocusNode nameFoc;
  late TextEditingController age;
  late FocusNode ageFoc;
  late TextEditingController work;
  late FocusNode workFoc;
  late GlobalKey<FormState> globalKey;
  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    nameFoc = FocusNode();
    age = TextEditingController();
    ageFoc = FocusNode();
    work = TextEditingController();
    workFoc = FocusNode();
    globalKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    nameFoc.dispose();
    age.dispose();
    ageFoc.dispose();
    work.dispose();
    workFoc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        title: Text(
          'الملف الشخصي',
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'الاسم ',
                    style: AppStyle.customText(
                      context,
                      AppStyle.title1,
                      FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  ChatTextField(
                    controller: name,
                    hint: context
                        .read<ProfileCubit>()
                        .currentUser!
                        .fullName
                        .toString(),
                    focusNode: nameFoc,
                    validator: (value) {
                      if (value == '' || value == null) {
                        return 'الاسم مطلوب';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'العمر ',
                    style: AppStyle.customText(
                      context,
                      AppStyle.title1,
                      FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  ChatTextField(
                    controller: age,
                    hint: context
                        .read<ProfileCubit>()
                        .currentUser!
                        .age
                        .toString(),
                    focusNode: ageFoc,
                    inputType: TextInputType.number,
                    validator: (value) {
                      if (value == '' || value == null) {
                        return 'لعمر مطلوب';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'العمل ',
                    style: AppStyle.customText(
                      context,
                      AppStyle.title1,
                      FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  ChatTextField(
                    controller: work,
                    hint: context
                        .read<ProfileCubit>()
                        .currentUser!
                        .job
                        .toString(),
                    focusNode: workFoc,
                  ),
                  SizedBox(height: 20),
                  BlocConsumer<ProfileCubit, ProfileState>(
                    listener: (context, state) {
                      if (state is ProfileSuccess) {
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
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                          ),
                        );
                        context.read<ProfileCubit>().loadUser(
                          context.read<AuthCubit>().currentUser!.id,
                        );
                      }
                      if (state is ProfileError) {
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
                              context.read<ProfileCubit>().updateProfile(
                                userId: context
                                    .read<AuthCubit>()
                                    .currentUser!
                                    .id,
                                fullName: name.text,
                                age: int.parse(age.text),
                                job: work.text,
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
      ),
    );
  }
}

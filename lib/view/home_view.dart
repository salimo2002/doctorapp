import 'package:doctorapp/cubits/dailyInformationCubit/daily_info_cubit.dart';
import 'package:doctorapp/cubits/dailyInformationCubit/daily_info_state.dart';
import 'package:doctorapp/cubits/drugsCubit/drugs_cubit.dart';
import 'package:doctorapp/cubits/drugsCubit/drugs_state.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/widgets/daily_info_list.dart';
import 'package:doctorapp/widgets/medicine_container.dart';
import 'package:doctorapp/widgets/search_text_field.dart';
import 'package:doctorapp/widgets/small_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DailyInfoCubit>(context).getDailyInfo();
    BlocProvider.of<DrugsCubit>(context).getDrugs();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyle.decoratedBackground(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 50),
        child: Column(
          children: [
            Center(
              child: Text(
                'الرئيسية',
                style: AppStyle.customText(
                  context,
                  AppStyle.h2,
                  FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: SearchTextField(
                hint: 'ابحث عن دواء',
                controller: TextEditingController(),
                focusNode: FocusNode(),
                ontap: () {},
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  BlocBuilder<DailyInfoCubit, DailyInfoState>(
                    builder: (context, state) {
                      if (state is DailyInfoSuccess) {
                        return DailyInfoList(dailyInfo: state.dailyInfo);
                      } else if (state is DailyInfoLoading) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        );
                      } else if (state is DailyInfoError) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              'حدث خطأ في جلب المعلومات اليومية',
                              style: AppStyle.customText(
                                context,
                                AppStyle.body,
                                FontWeight.w700,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  BlocBuilder<DrugsCubit, DrugsState>(
                    builder: (context, state) {
                      if (state is DrugsSuccess) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: SmallCategories(
                                label1: 'جميع الادوية',
                                icon1: Icons.link,
                                label2: 'الادوية المفقودة',
                                icon2: Icons.remove_red_eye,
                              ),
                            ),
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: state.drugs.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return MedicineContainer(
                                  drug: state.drugs[index],
                                );
                              },
                            ),
                          ],
                        );
                      } else if (state is DrugsLoading) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        );
                      } else if (state is DrugsError) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              'حدث خطأ في جلب الادوية',
                              style: AppStyle.customText(
                                context,
                                AppStyle.body,
                                FontWeight.w700,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

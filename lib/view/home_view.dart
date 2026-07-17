import 'package:doctorapp/cubits/authCubit/auth_cubit.dart';
import 'package:doctorapp/cubits/dailyInformationCubit/daily_info_cubit.dart';
import 'package:doctorapp/cubits/dailyInformationCubit/daily_info_state.dart';
import 'package:doctorapp/cubits/drugsCubit/drugs_cubit.dart';
import 'package:doctorapp/cubits/drugsCubit/drugs_state.dart';
import 'package:doctorapp/cubits/favoritesCubit/favorites_cubit.dart';
import 'package:doctorapp/cubits/favoritesCubit/favorites_state.dart';
import 'package:doctorapp/cubits/pharmacyCubit/pharmacy_cubit.dart';
import 'package:doctorapp/cubits/profileCubit/profile_cubit.dart';
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
    context.read<ProfileCubit>().loadUser(
      BlocProvider.of<AuthCubit>(context).currentUser!.id,
    );
    BlocProvider.of<DailyInfoCubit>(context).getDailyInfo();
    BlocProvider.of<DrugsCubit>(context).getDrugs();
    BlocProvider.of<FavoritesCubit>(
      context,
    ).loadFavorites(BlocProvider.of<AuthCubit>(context).currentUser!.id);
    BlocProvider.of<PharmacyCubit>(context).loadPharmacies();
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
                  BlocListener<FavoritesCubit, FavoritesState>(
                    listenWhen: (previous, current) =>
                        current is FavoriteActionSuccess,
                    listener: (context, state) {
                      if (state is FavoriteActionSuccess) {
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
                      }
                    },
                    child: BlocBuilder<DrugsCubit, DrugsState>(
                      builder: (context, state) {
                        if (state is DrugsSuccess) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 50,
                                child: SmallCategories(
                                  onChanged: (isAll) {
                                    if (isAll) {
                                      context.read<DrugsCubit>().changeFilter(
                                        DrugsFilter.all,
                                      );
                                    } else {
                                      context.read<DrugsCubit>().changeFilter(
                                        DrugsFilter.missing,
                                      );
                                    }
                                  },
                                  label1: 'جميع الادوية',
                                  label2: 'الادوية المفقودة',
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
                                    ontap: () async {
                                      await context
                                          .read<FavoritesCubit>()
                                          .toggleFavorite(
                                            userId: context
                                                .read<AuthCubit>()
                                                .currentUser!
                                                .id,
                                            drugId: state.drugs[index].id,
                                          );
                                    },
                                  );
                                },
                              ),
                            ],
                          );
                        } else if (state is DrugsLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          );
                        } else if (state is DrugsError) {
                          return Center(
                            child: Text(
                              'حدث خطأ في جلب الادوية',
                              style: AppStyle.customText(
                                context,
                                AppStyle.body,
                                FontWeight.w700,
                              ),
                            ),
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      },
                    ),
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

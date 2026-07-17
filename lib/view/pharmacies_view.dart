import 'package:doctorapp/cubits/pharmacyCubit/pharmacy_cubit.dart';
import 'package:doctorapp/cubits/pharmacyCubit/pharmacy_state.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/utils/format_date.dart';
import 'package:doctorapp/utils/open_map.dart';
import 'package:doctorapp/widgets/search_text_field.dart';
import 'package:doctorapp/widgets/pharmacy_container.dart';
import 'package:doctorapp/widgets/small_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PharmaciesView extends StatefulWidget {
  const PharmaciesView({super.key});

  @override
  State<PharmaciesView> createState() => _PharmaciesViewState();
}

class _PharmaciesViewState extends State<PharmaciesView> {
  late TextEditingController search;
  late FocusNode searchFoc;

  @override
  void initState() {
    super.initState();
    search = TextEditingController();
    searchFoc = FocusNode();

    context.read<PharmacyCubit>().loadPharmacies();
  }

  @override
  void dispose() {
    search.dispose();
    searchFoc.dispose();
    super.dispose();
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
                'الصيدليات',
                style: AppStyle.customText(
                  context,
                  AppStyle.h1,
                  FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: SearchTextField(
                hint: 'ابحث عن صيدلية',
                controller: search,
                focusNode: searchFoc,
                ontap: () {},
                onChanged: (value) {
                  context.read<PharmacyCubit>().searchPharmacy(value);
                },
              ),
            ),

            const SizedBox(height: 15),
            SizedBox(
              height: 50,
              child: SmallCategories(
                onChanged: (isAll) {
                  if (isAll) {
                    context.read<PharmacyCubit>().changeFilter(
                      PharmacyFilter.all,
                    );
                  } else {
                    context.read<PharmacyCubit>().changeFilter(
                      PharmacyFilter.onDuty,
                    );
                  }
                },
                label1: 'جميع الصيدليات',
                label2: 'الصيدليات المناوبة',
              ),
            ),
            Expanded(
              child: BlocBuilder<PharmacyCubit, PharmacyState>(
                builder: (context, state) {
                  if (state is PharmacyLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    );
                  }
                  if (state is PharmacyLoaded) {
                    final cubit = context.read<PharmacyCubit>();
                    if (cubit.currentFilter == PharmacyFilter.all) {
                      final pharmacies = cubit.filteredAllPharmacies;
                      if (pharmacies.isEmpty) {
                        return const Center(child: Text('لا توجد نتائج'));
                      }
                      return ListView.builder(
                        itemCount: pharmacies.length,
                        itemBuilder: (context, index) {
                          final pharmacy = pharmacies[index];
                          return PharmacyContainer(
                            pharmacyLabel: pharmacy.name,
                            isOpen: isOpenNow(pharmacy),
                            pharmacyLocation: () {
                              openMap(pharmacy.latitude, pharmacy.longitude);
                            },
                            location: pharmacy.address,
                            address: pharmacy.address,
                            workingHours: formatWorkingHours(
                              pharmacy.openingTime,
                              pharmacy.closingTime,
                            ),
                            phoneNumber: pharmacy.phoneNumber,
                          );
                        },
                      );
                    }
                    final onDutyList = cubit.filteredOnDutyPharmacies;
                    if (onDutyList.isEmpty) {
                      return const Center(child: Text('لا توجد نتائج'));
                    }
                    return ListView.builder(
                      itemCount: onDutyList.length,
                      itemBuilder: (context, index) {
                        final onDuty = onDutyList[index];
                        final pharmacy = onDuty.pharmacy;
                        return PharmacyContainer(
                          pharmacyLabel: pharmacy.name,
                          isOpen: true,
                          pharmacyLocation: () {
                            openMap(pharmacy.latitude, pharmacy.longitude);
                          },
                          location: pharmacy.address,
                          address: pharmacy.address,
                          workingHours:
                              'مناوبة من ${onDuty.startTime?.substring(0, 5)} حتى ${onDuty.endTime?.substring(0, 5)}',
                          phoneNumber: pharmacy.phoneNumber,
                        );
                      },
                    );
                  }
                  if (state is PharmacyError) {
                    return const Center(
                      child: Text('حدث خطأ في جلب الصيدليات'),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

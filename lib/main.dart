import 'package:doctorapp/cubits/authCubit/auth_cubit.dart';
import 'package:doctorapp/cubits/dailyInformationCubit/daily_info_cubit.dart';
import 'package:doctorapp/cubits/drugsCubit/drugs_cubit.dart';
import 'package:doctorapp/cubits/favoritesCubit/favorites_cubit.dart';
import 'package:doctorapp/cubits/pharmacyCubit/pharmacy_cubit.dart';
import 'package:doctorapp/cubits/profileCubit/profile_cubit.dart';
import 'package:doctorapp/theme/theme_provider.dart';
import 'package:doctorapp/view/about_app_view.dart';
import 'package:doctorapp/view/log_in_view.dart';
import 'package:doctorapp/view/main_views.dart';
import 'package:doctorapp/view/password_reset_view.dart';
import 'package:doctorapp/view/personal_info_view.dart';
import 'package:doctorapp/view/usage_policy_view.dart';
import 'package:doctorapp/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://oiawqwnohtlommzjulvj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9pYXdxd25vaHRsb21temp1bHZqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg4NjExNzAsImV4cCI6MjA4NDQzNzE3MH0.Cd1G2QXzUSNYi1k9BU2eSoHKk3to1NJI-pzsBfawpXQ',
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const DoctorApp(),
    ),
  );
}

class DoctorApp extends StatelessWidget {
  const DoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DailyInfoCubit>(create: (context) => DailyInfoCubit()),
        BlocProvider<DrugsCubit>(create: (context) => DrugsCubit()),
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<FavoritesCubit>(create: (context) => FavoritesCubit()),
        BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
        BlocProvider<PharmacyCubit>(create: (context) => PharmacyCubit()),
      ],
      child: MaterialApp(
        theme: Provider.of<ThemeProvider>(context).currentTheme,
        debugShowCheckedModeBanner: false,
        routes: {
          MainViews.id: (context) => MainViews(),
          LogInView.id: (context) => LogInView(),
          RegisterView.id: (context) => RegisterView(),
          PersonalInfoView.id: (context) => PersonalInfoView(),
          PasswordResetView.id: (context) => PasswordResetView(),
          AboutAppView.id: (context) => AboutAppView(),
          UsagePolicyView.id: (context) => UsagePolicyView(),
        },
        initialRoute: LogInView.id,
      ),
    );
  }
}

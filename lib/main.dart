import 'package:doctorapp/theme/theme_provider.dart';
import 'package:doctorapp/view/log_in_view.dart';
import 'package:doctorapp/view/main_views.dart';
import 'package:doctorapp/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        MainViews.id: (context) => MainViews(),
        LogInView.id:(context)=> LogInView(),
        RegisterView.id:(context)=> RegisterView(),
        },
      initialRoute: LogInView.id,
    );
  }
}

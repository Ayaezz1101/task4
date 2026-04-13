import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:task4/pages/onboarding.dart';
import 'package:task4/provider/coffeeProvidor.dart';
import 'package:task4/theme/appTheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://bitatthfuirecjhpwcpt.supabase.co',
    anonKey: 'sb_publishable_Kemi2cQ1uhzd-PR0jbDaOQ_3t_a5YsN',
  );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CoffeeProvider()..fetchAllProducts()..loadCart()),
      ],
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: const OnboardingPage(),
        );
      },
    );
  }
}
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanytask/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder:
          (_, __) => MaterialApp(
            title: 'Mohamed Hany',
            theme: ThemeData(fontFamily: 'Inter'),
            debugShowCheckedModeBanner: false,

            home: HomeScreen(),
          ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proteinium/navigation_screen.dart';
import 'package:proteinium/viewmodel/bottom_nav_viewmodel.dart';
import 'package:proteinium/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: MediaQuery.of(context).size.width >= 900
            ? const Size(3486, 1052)
            : MediaQuery.of(context).size.width >= 600
                ? const Size(2148, 1636)
                : const Size(1080, 2220),
        minTextAdapt: true,
        builder: (_, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Proteinium',
            home: BottomNavigationScreen(),
          );
        });
  }
}

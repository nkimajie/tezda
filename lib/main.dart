import 'package:tezda/features/auth/provider/auth_provider.dart';
import 'package:tezda/features/home/provider/home_provider.dart';
import 'package:tezda/features/onboarding/splash.dart';
import 'package:tezda/features/profile/provider/profile_provider.dart';
import 'package:tezda/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashPage.routeName,
          routes: routes,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
      ),
    );
  }
}

void showToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2), // Duration to show the SnackBar
    ),
  );
}

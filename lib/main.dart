import 'package:cycle_ai/views/screens/google_maps.dart';
import 'package:cycle_ai/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'common/widgets/constants.dart';
import 'core/navigator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CYCLE AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(color: kMainPrimaryColor),
      ),
      home: const GoogleMapsPage(),
      navigatorKey: AppNavigator.navKey,
      onGenerateRoute: AppRouter.generateRoutes,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'filesforimport.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  //testing out the push request
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CYCLE AI',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(color: kMainPrimaryColor),
      ),
      onGenerateRoute: (settings) {
        return generateRoute(settings);
      },
      home: const LoginPage(),
    );
  }
}

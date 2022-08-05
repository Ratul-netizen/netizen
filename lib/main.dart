import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netizen/responsive/mobile_screen_layout.dart';
import 'package:netizen/responsive/responsive_layout_screen.dart';
import 'package:netizen/responsive/web_screen_layout.dart';
import 'package:netizen/screens/login_screen.dart';
import 'package:netizen/screens/signup_screen.dart';
import 'package:netizen/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyB05mNO03Q_nnekfixCg8k05SbXJTqcIVo',
          appId: '1:810923245124:web:bbae59b3577a273613c611',
          messagingSenderId: '810923245124',
          projectId: 'netizen-9f797',
          storageBucket: 'netizen-9f797.appspot.com'),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netizen',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      //   mobileScreenlayout: MobileScreenLayout(),
      //   webScreenlayout: WebScreenLayout(),
      // ),
      home: const SignupScreen(),
    );
  }
}

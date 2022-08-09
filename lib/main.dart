import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netizen/providers/user_provider.dart';
import 'package:netizen/responsive/mobile_screen_layout.dart';
import 'package:netizen/responsive/responsive_layout_screen.dart';
import 'package:netizen/responsive/web_screen_layout.dart';
import 'package:netizen/screens/login_screen.dart';
import 'package:netizen/utils/colors.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Netizen',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return  const ResponsiveLayout(
                  mobileScreenlayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(), 
                  mobileScreenLayout: MobileScreenLayout(), 
                  webScreenlayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const LoginScreen();
          },
        ),
      ),
    );
  }
}

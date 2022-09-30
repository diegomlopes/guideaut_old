import 'package:flutter/material.dart';
import 'package:guidealt/presentation/features/home/pages/home_page.dart';
import 'package:guidealt/presentation/features/panel/pages/edit_recomendation_page.dart';
import 'package:guidealt/presentation/features/panel/pages/panel_page.dart';
import 'package:guidealt/presentation/features/proaut/pages/proaut_page.dart';
import 'package:guidealt/presentation/features/search/pages/search_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:guidealt/presentation/features/signin/pages/signin_page.dart';
import 'package:guidealt/presentation/features/signup/pages/signup_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GuideAut',
      initialRoute: HomePage.route,
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.route: (context) => const HomePage(),
        SearchPage.route: (context) => const SearchPage(),
        ProAutPage.route: (context) => const ProAutPage(),
        PanelPage.route: (context) => const PanelPage(),
        EditRecomendationPage.route: (context) => const EditRecomendationPage(),
        SignInPage.route: (context) => const SignInPage(),
        SignUpPage.route: (context) => const SignUpPage()
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
    );
  }
}
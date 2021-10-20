import 'package:bsafe24x7/Other_Pages/add_contacts.dart';
import 'package:bsafe24x7/Other_Pages/healthcare_page.dart';
import 'package:bsafe24x7/Other_Pages/helpline.dart';
import 'package:bsafe24x7/Other_Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bsafe24x7/Auth/Login.dart';
import 'package:bsafe24x7/Auth/Register.dart';
import 'package:bsafe24x7/Other_Pages/splash_page.dart';

import 'Util/Constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      title: "BSafe-24x7",
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
        primarySwatch: Colors.green,
      ),
      // theme: ThemeData.dark().copyWith(accentColor: Colors.green),
      // theme: ThemeData.light().copyWith(accentColor: Colors.green),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HelplinePage(),
        // "/": (context) => AddContactsPage(),
        // "/": (context) => HealthCarePage(),
        // "/": (context) => HomePage(),

        // "/": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/addContacts": (context) => AddContactsPage(),
        "/helpline": (context) => HelplinePage(),
      },
      initialRoute: "/",
    );
  }
}


import 'package:bsafe24x7/Other_Pages/Profile_page.dart';
import 'package:bsafe24x7/Other_Pages/splash_page.dart';
import 'package:bsafe24x7/Other_Pages/add_contacts.dart';
import 'package:bsafe24x7/Other_Pages/escapeThreat.dart';
import 'package:bsafe24x7/Other_Pages/healthcare_page.dart';
import 'package:bsafe24x7/Other_Pages/helpline.dart';
import 'package:bsafe24x7/Other_Pages/home_page.dart';
import 'package:bsafe24x7/Other_Pages/women_safety_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bsafe24x7/Auth/verify_phone.dart';
import 'package:bsafe24x7/Other_Pages/splash_page.dart';
import 'package:bsafe24x7/Auth/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Util/Constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        primarySwatch: MaterialColor(0xFFF06292,{
          50: Color.fromARGB(26, 255, 96, 125),
          100: Color.fromARGB(51, 255, 96, 125),
          200: Color.fromARGB(77, 255, 96, 125),
          300: Color.fromARGB(102, 255, 96, 125),
          400: Color.fromARGB(128, 255, 96, 125),
          500: Color.fromARGB(153, 255, 96, 125),
          600: Color.fromARGB(179, 255, 96, 125),
          700: Color.fromARGB(204, 255, 96, 125),
          800: Color.fromARGB(230, 255, 96, 125),
          900: Color.fromARGB(255, 255, 96, 125),
        }),
      ),
      // theme: ThemeData.dark().copyWith(accentColor: Colors.green),
      // theme: ThemeData.light().copyWith(accentColor: Colors.green),
      debugShowCheckedModeBanner: false,
      routes: {

         // "/": (context) => SplashPage(),
         "/": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/profile": (context) => UserProfilePage(),
        "/addContacts": (context) => AddContactsPage(),
        "/helpline": (context) => HelplinePage(),
        "/healthcare": (context) => HealthCarePage(),
        "/womensafety" : (context) => WomenSafetyPage(),
        "/escapethreat" : (context) => EscapeThreatPage(),
        "/homepage" : (context) => HomePage(),
        "/verify": (context) => VerifyOTPPage(phone: "",),

      },
      initialRoute: "/",
    );
  }
}

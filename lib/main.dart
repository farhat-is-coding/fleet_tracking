// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleet_tracker/firebase_options.dart';
import 'package:fleet_tracker/screens/register/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:fleet_tracker/screens/admin/admin_setting.dart';
import 'package:fleet_tracker/screens/delivery_trip_screen/delivery_info.dart';
import 'package:fleet_tracker/screens/admin/admin_login_screen.dart';
import 'package:fleet_tracker/screens/admin/admin_panel.dart';
import 'package:fleet_tracker/screens/customer/customer_tracking_trucker.dart';
import 'package:fleet_tracker/screens/login/login_screen.dart';
import 'package:fleet_tracker/screens/trucker/trucker_delivering_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fleet_tracker/screens/pre_app/check_screen.dart';
import 'package:fleet_tracker/screens/pre_app/splash.dart';
import 'package:fleet_tracker/screens/customer/user_searching_for_driver.dart';

import 'constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fleet Tracker',
      theme: kThemeData,
      routes: {
        '/':(context) => Splash(),
        '/login':(context) => LoginScreen(),
        '/register':(context) => RegisterScreen(),
        '/trucker' : (context) => TruckerDeliveryScreen(),
        '/delivery': (context) => DeliveryScreen(),
        '/usertracking':(context) => UserSearching(),
        '/driverlocation':(context) => DriverLocation(driverEmail: '', status: '',),
        '/adminlogin':(context) => AdminLogin(),
        '/adminpanel': (context) => AdminPanel(),
        '/adminsetting': (context) => AdminSetting(),
        '/check': (context)=> CheckScreen(),
      },
    );
  }
}

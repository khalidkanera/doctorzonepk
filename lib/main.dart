import 'dart:async';
import 'dart:io';

import 'package:doctorzone/screens/history_appointment_screen.dart';
import 'package:doctorzone/screens/inbox_screen.dart';

import './screens/getappointment_screen.dart';
import './screens/previous_medicalrecord_screen.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import './screens/testscreen.dart';
import './screens/pending_appoitnment_screen.dart';
import './screens/medicalrecord_screen.dart';
import './screens/appointment_screen.dart';
import 'screens/getappointment_screen.dart';
//import './screens/googlemap_screen.dart';
import './screens/selected_doctor_screen.dart';
import './screens/AvailableDoctorScreen.dart';
import './screens/alldoctors_personal_data_screen.dart';
import './screens/edit_patient_profile_screen.dart';
import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import './screens/services_screen.dart';
import './screens/patient_profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences _logindata;
  String _uID;
  bool _isLoading = true;
  bool _isInit = true;
  Future didChangeDependencies() async {
    if (_isInit) {
      await initial();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future initial() async {
    setState(() {
      _isLoading = true;
    });
    // ignore: invalid_use_of_visible_for_testing_member
    // SharedPreferences.setMockInitialValues({});
    _logindata = await SharedPreferences.getInstance();
    _uID = _logindata.getString('id');

    print('uID : $_uID');
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoctorZone',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        ),
        primaryColor: Colors.indigo.shade900,
        colorScheme: ColorScheme.light(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: _isLoading == true
          ? SplashScreen()
          : _uID != null
              ? ServicesScreen()
              : SignInScreen(),
      routes: {
        SignInScreen.routeName: (_) => SignInScreen(),
        SignupScreen.routeName: (_) => SignupScreen(),
        ServicesScreen.routeName: (_) => ServicesScreen(),
        AvailAbleDoctorScreen.routeName: (_) => AvailAbleDoctorScreen(),
        ProfileScreen.routeName: (_) => ProfileScreen(),
        EditUserProfileScreen.routeName: (_) => EditUserProfileScreen(),
        DoctorsProfileScreen2.routeName: (_) => DoctorsProfileScreen2(),
        SelectedDoctorProfileScreen.routeName: (_) =>
            SelectedDoctorProfileScreen(),
        AppointmentScreen.routeName: (_) => AppointmentScreen(),
        GetAppointmentScreen.routeName: (_) => GetAppointmentScreen(),
        // GoogleMapScreen.routeName: (_) => GoogleMapScreen(),
        PendingAppointmentScreen.routeName: (_) => PendingAppointmentScreen(),
        MedicalRecordScreen.routeName: (_) => MedicalRecordScreen(),
        TestScreen.routeName: (_) => TestScreen(),
        PreviousMedicalRecordScreen.routeName: (_) =>
            PreviousMedicalRecordScreen(),
        InboxScreen.routeName: (_) => InboxScreen(),
        HistoryScreen.routeName: (_) => HistoryScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //  Timer(
    //     Duration(seconds: 3),
    //     () => Navigator.of(context).pushNamed( ServicesScreen.routeName));
  } //

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 180,
          height: 180,
          child: Center(
            child: Image.asset("asset/logo/DoctorZone.png"),
          ),
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

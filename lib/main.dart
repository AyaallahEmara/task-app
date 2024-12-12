import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task/core/constants.dart';
import 'package:task/core/utils/size_config.dart';
import 'package:task/firebase_options.dart';
import 'package:task/view/login_view.dart';
import 'package:task/view/register_view.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  MaterialApp(
      routes: {
        'LoginView' : (context) => LoginView(),
        RegisterView.registerid : (context) => RegisterView(),
      },
      initialRoute: 'LoginView',
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }



}

import 'package:flutter/material.dart';
import 'package:fpa_projeto/android/styles.dart';
import 'package:fpa_projeto/android/views/splash.view.dart';
class AndroidApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Defesa Civil do Recife',
      debugShowCheckedModeBanner: false,
      theme: androidTheme(),
      home: SplashView()
    );
  }
}
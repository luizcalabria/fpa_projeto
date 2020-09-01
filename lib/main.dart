import 'dart:io';
import 'package:fpa_projeto/android/android.app.dart';
import 'package:flutter/material.dart';

void main() {
  if (Platform.isIOS){

  } else if (Platform.isAndroid) {
    runApp(AndroidApp());
  } else {

  }
}


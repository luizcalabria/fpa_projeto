import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:fpa_projeto/android/android.app.dart';

void main() {
  if (Platform.isIOS){

  } else if (Platform.isAndroid) {
    runApp(AndroidApp());
  } else {

  }
}


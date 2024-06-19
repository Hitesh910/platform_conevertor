import 'package:flutter/material.dart';
import 'package:platform_conevertor/screen/home/view/home_screen_android.dart';
import 'package:platform_conevertor/screen/home/view/home_screen_ios.dart';

Map<String,WidgetBuilder> app_routes_android = {
  "/":(context)=> HomeScreenAndroid()
};

Map<String,WidgetBuilder> app_routes_ios = {
  "/":(context)=> HomeScreenIos()
};
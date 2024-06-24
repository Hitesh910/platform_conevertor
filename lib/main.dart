import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_conevertor/componet/provider/internet_provider.dart';
import 'package:platform_conevertor/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

import 'app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: HomeProvider(),
      ),
      ChangeNotifierProvider.value(value: InternetProvider()..checkInternet())
    ],
    child: Consumer<HomeProvider>(builder: (context, value, child) {
     return value.isIos == false?
     MaterialApp(
       debugShowCheckedModeBanner: false,
              routes: app_routes_android,
            )
      : CupertinoApp(
       debugShowCheckedModeBanner: false,
          routes: app_routes_ios,
          );
    },),
  )
      //   Platform.isAndroid?MaterialApp(
      //     routes: app_routes_android,
      //   )
      // :CupertinoApp(
      // routes: app_routes_ios,
      // )
      );
}

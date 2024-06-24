import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_conevertor/componet/provider/internet_provider.dart';
import 'package:platform_conevertor/componet/view/internet_widget.dart';
import 'package:platform_conevertor/screen/call/view/call_screen_android.dart';
import 'package:platform_conevertor/screen/chat/view/chat_screen_android.dart';
import 'package:platform_conevertor/screen/status/view/status_screen_android.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomeScreenAndroid extends StatefulWidget {
  const HomeScreenAndroid({super.key});

  @override
  State<HomeScreenAndroid> createState() => _HomeScreenAndroidState();
}

class _HomeScreenAndroidState extends State<HomeScreenAndroid> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return
        // PopScope(
        //   canPop: false,
        //   onPopInvoked: (didPop) {
        //     exitDialog();
        //   },
        //   child:
        DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text("Android"),
          actions: [
            Switch(
              value: providerW!.isIos,
              onChanged: (value) {
                providerR!.isCheck();
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Chat",
              ),
              Tab(
                text: "Status",
              ),
              Tab(
                text: "Call",
              )
            ],
          ),
        ),
        body: context.watch<InternetProvider>().isInternet
            ? TabBarView(
                children: [
                  ChatScreenAndroid(),
                  StatusScreenAndroid(),
                  CallScreenAndroid(),
                ],
              )
            : Center(child: InternetWidget()),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: providerW!.selectedIndex,
          onTap: (value) {
            providerR!.changeBottomBar(value);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.refresh), label: "Status"),
            BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call")
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_conevertor/screen/call/view/call_screen_ios.dart';
import 'package:platform_conevertor/screen/chat/view/chat_screen_ios.dart';
import 'package:platform_conevertor/screen/status/view/status_screen_ios.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomeScreenIos extends StatefulWidget {
  const HomeScreenIos({super.key});

  @override
  State<HomeScreenIos> createState() => _HomeScreenIosState();
}

class _HomeScreenIosState extends State<HomeScreenIos> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        exitDialog();
      },
      child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: const Text("Ios"),
            trailing: CupertinoSwitch(
              value: providerW!.isIos,
              onChanged: (value) {
                providerR!.isCheck();
              },
            ),
          ),
          child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                ),
                BottomNavigationBarItem(icon: Icon(Icons.radar_outlined)),
                BottomNavigationBarItem(icon: Icon(Icons.call))
              ],
            ),
            tabBuilder: (context, index) {
              return index == 0 ? ChatScreenIos() : index == 1 ? StatusScreenIos() :CallScreenIos();
              // Column(
              //   children: [
              //     SizedBox(height: 80,),
              //     CupertinoSlidingSegmentedControl(
              //       children: {
              //         "chat": Text("Chat screen"),
              //         "status": Text("Status screen"),
              //         "call": Text("Call Screen")
              //       },
              //       onValueChanged: (value) {
              //         providerR?.isSelect(value as String);
              //       },
              //       groupValue: providerW?.selectedSegment,
              //     ),
              //     Expanded(
              //       child: providerW?.selectedSegment == "chat"
              //           ? ChatScreenIos()
              //           : providerW?.selectedSegment == "status"
              //           ? StatusScreenIos()
              //           : CallScreenIos(),
              //     )
              //   ],
              // ),
            },
          )),
    );
  }

  void exitDialog() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          actions: [
            CupertinoButton(
              child: const Text("Yes"),
              onPressed: () {
                exit(0);
              },
            ),
            CupertinoButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
          title: const Text("Exit"),
        );
      },
    );
  }
}

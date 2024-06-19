import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';
class ChatScreenIos extends StatefulWidget {
  const ChatScreenIos({super.key});

  @override
  State<ChatScreenIos> createState() => _ChatScreenIosState();
}

class _ChatScreenIosState extends State<ChatScreenIos> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            child: const Text("Bottom Sheet"),
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return CupertinoActionSheet(
                    title: const Text("Are you sure Exit?"),
                    actions: [
                      CupertinoActionSheetAction(
                        onPressed: () {},
                        child: const Text("Yes"),
                        isDefaultAction: true,
                      ),
                      CupertinoActionSheetAction(
                          onPressed: () {}, child: const Text("No")),
                      CupertinoActionSheetAction(
                        onPressed: () {},
                        child: const Text("Cancle"),
                        isDestructiveAction: true,
                      )
                    ],
                  );
                },
              );
            },
          ),
          CupertinoContextMenu(
            actions: [
              const CupertinoContextMenuAction(
                isDefaultAction: true,
                child: Text("Click 1"),
              ),
              const CupertinoContextMenuAction(
                child: Text("Click 2"),
              ),
              const CupertinoContextMenuAction(
                child: Text("Click 3"),
              ),
              const CupertinoContextMenuAction(
                isDestructiveAction: true,
                child: Text("Click 4"),
              ),
            ],
            child: Container(
              color: Colors.white,
              child: const FlutterLogo(
                size: 100,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return Container(
                    height: 250,
                    color: Colors.white,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (value) {
                        providerR!.Date(value);
                      },
                    ),
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_month),
                const SizedBox(
                  width: 10,
                ),
                // CupertinoButton(
                //   child: Icon(Icons.calendar_month),
                //   onPressed: () {
                //     // showCupertinoModalPopup(
                //     //   context: context,
                //     //   builder: (context) {
                //     //     return Container(
                //     //       height: 250,
                //     //       color: Colors.white,
                //     //       child: CupertinoDatePicker(
                //     //         mode: CupertinoDatePickerMode.date,
                //     //         onDateTimeChanged: (value) {
                //     //           providerR!.Date(value);
                //     //         },
                //     //       ),
                //     //     );
                //     //   },
                //     // );
                //   },
                // ),
                Text(
                    "${providerW!.date.day}/${providerW!.date.month}/${providerW!.date.year}")
              ],
            ),
          ),

          // ], child: FlutterLogo(),)
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return Container(
                    height: 250,
                    color: CupertinoColors.white,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      onDateTimeChanged: (value) {
                        TimeOfDay t1 =
                        TimeOfDay(hour: value.hour, minute: value.minute);
                        providerR!.changeTime(t1);
                      },
                    ),
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.watch_later),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  ("${providerW!.time.hour}:${providerW!.time.minute}"),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CupertinoButton.filled(
            child: const Text("Dialog"),
            onPressed: () {
              exitDialog();
            },
          )
        ],
      ),
    );
  }

  void exitDialog() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return  CupertinoAlertDialog(
          actions: [
            CupertinoButton(child:  const Text("Yes"), onPressed: () {
              exit(0);
            },),
            CupertinoButton(child: const Text("No"), onPressed: () {
              Navigator.pop(context);
            },)
          ],
          title: const Text("Exit"),
        );
      },
    );
  }
}

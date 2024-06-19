import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';
class ChatScreenAndroid extends StatefulWidget {
  const ChatScreenAndroid({super.key});

  @override
  State<ChatScreenAndroid> createState() => _ChatScreenAndroidState();
}

class _ChatScreenAndroidState extends State<ChatScreenAndroid> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();

    return Scaffold(
      key: scaffoldKey,
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  scaffoldKey.currentState!.showBottomSheet(
                        (context) => BottomSheet(
                      onClosing: () {},
                      builder: (context) {
                        return Container(
                            alignment: Alignment.topCenter,
                            child: Text("Hello"));
                      },
                    ),
                  );
                },
                child: Text("Bottom Sheet")),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BottomSheet(
                      onClosing: () {},
                      builder: (context) {
                        return Text("Hello");
                      },
                    );
                  },
                );
              },
              child: Text("Modal Bottom Sheet"),
            ),
            TextButton.icon(
              onPressed: () async {
                DateTime? d1 = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2001),
                  lastDate: DateTime(2030),
                );
                providerR!.Date(d1!);
              },
              label: Text(
                  "${providerW!.date.day}/${providerW!.date.month}/${providerW!.date.year}"),
              icon: Icon(Icons.calendar_month),
            ),
            TextButton.icon(
              onPressed: () async {
                TimeOfDay? time = await showTimePicker(
                    context: context, initialTime: providerR!.time);
                providerR!.changeTime(time!);
              },
              label:
              Text("${providerW!.time.hour}: ${providerW!.time.minute}"),
              icon: Icon(Icons.watch_later),
            ),
            ElevatedButton(
              onPressed: () {
                exitDialog();
              },
              child: Text("Dialog"),
            ),
            CircularProgressIndicator.adaptive(),
            Icon(Icons.adaptive.arrow_back_rounded)
          ],
        ),
      ),
    );
  }

  void exitDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Are you sure Exit"),
          content: Text("Exit"),
          actions: [
            ElevatedButton(
              onPressed: () {
                exit(0);
              },
              child: Text("Yes"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No"))
          ],
        );
      },
    );
  }
}

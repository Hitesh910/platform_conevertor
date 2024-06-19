import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CallScreenIos extends StatefulWidget {
  const CallScreenIos({super.key});

  @override
  State<CallScreenIos> createState() => _CallScreenIosState();
}

class _CallScreenIosState extends State<CallScreenIos> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Text("Call Screen"),
      )
    );
  }
}

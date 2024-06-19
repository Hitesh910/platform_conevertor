import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusScreenIos extends StatefulWidget {
  const StatusScreenIos({super.key});

  @override
  State<StatusScreenIos> createState() => _StatusScreenIosState();
}

class _StatusScreenIosState extends State<StatusScreenIos> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            leading: Text("Contact"),
            trailing: Icon(CupertinoIcons.capsule_fill),
            middle: Text("Show contact"),
            largeTitle: Text("Contacts"),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return CupertinoListTile(
                title: Text("Hello"),
                leading: Text("$index"),
              );
            },
          )
        ],
      ),
    );
  }
}

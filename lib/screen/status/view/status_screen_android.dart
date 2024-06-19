import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusScreenAndroid extends StatefulWidget {
  const StatusScreenAndroid({super.key});

  @override
  State<StatusScreenAndroid> createState() => _StatusScreenAndroidState();
}

class _StatusScreenAndroidState extends State<StatusScreenAndroid> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(

      slivers: [
        SliverAppBar(
          forceMaterialTransparency: true,
           snap: false,
          pinned: false,
          stretch: false,
          title: Text("Status"),
          floating: true,
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
              return  Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green.shade200),
                );
              },
            ),
          ),
        ),
        SliverList.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              color: Colors.red.shade200,
              margin: EdgeInsets.all(10),
            );
          },
        ),
        SliverGrid.builder(
          itemCount: 20,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(10),
              color: Colors.green,
            );
          },
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return
                    // Text("Hello");
                    Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  margin: EdgeInsets.all(10),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

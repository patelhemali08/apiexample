import 'package:flutter/material.dart';

class Enimationxample extends StatefulWidget {


  @override
  State<Enimationxample> createState() => _EnimationxampleState();
}

class _EnimationxampleState extends State<Enimationxample> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Ani..XYZ",),
              Tab(text: "Tween",),
              Tab(text: "XYZTra",),
              Tab(text: "Builder",)
            ],
          ),
          backgroundColor: Colors.pink,
          title: Text("Enimationxample"),
        ),
        body: TabBarView(
            children: [
              
            ]
        ),
      ),
    );
  }
}

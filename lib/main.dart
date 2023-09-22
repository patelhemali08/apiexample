
import 'package:apiexample1/Employee/ApiExample1.dart';
import 'package:apiexample1/Comman/Enimationxample.dart';
import 'package:apiexample1/Comman/GeoLocator.dart';
import 'package:apiexample1/Comman/HomePage.dart';
import 'package:apiexample1/Employee/PostData.dart';

import 'package:apiexample1/Employee/ViewApiExample1.dart';
import 'package:apiexample1/Employee/getapi.dart';
import 'package:apiexample1/Provider/EmployeeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (context)=>EmployeeProvider(),)],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,

        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}



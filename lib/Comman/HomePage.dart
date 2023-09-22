import 'package:apiexample1/Employee/ApiExample1.dart';
import 'package:apiexample1/Employee/ViewApiExample1.dart';
import 'package:apiexample1/Employee/ViewModalApiExample.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("ApiExample"),
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ApiExample1())
                );
              },
            ),
            Divider(thickness: 1,color: Colors.black,),
            ListTile(
              title: Text("ViewApiExample"),
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ViewApiExample1())
                );
              },
            ),
            Divider(thickness: 1,color: Colors.black,),
            ListTile(
              title: Text("ViewModalApiExample"),
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ViewModalApiExample())
                );
              },
            ),
            Divider(thickness: 1,color: Colors.black,),

            // ListTile(
            //   onTap: (){
            //     Navigator.of(context).push(
            //         MaterialPageRoute(builder: (context)=>ApiExample1())
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

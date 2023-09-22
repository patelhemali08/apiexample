import 'dart:convert';


import 'package:apiexample1/Employee/ViewApiExample1.dart';
import 'package:apiexample1/Provider/EmployeeProvider.dart';
import 'package:apiexample1/Resource/UrlResorce.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';

class ApiExample1 extends StatefulWidget {


  @override
  State<ApiExample1> createState() => _ApiExample1State();
}

class _ApiExample1State extends State<ApiExample1> {

  TextEditingController _ename = TextEditingController();
  TextEditingController _salary = TextEditingController();
  var select = "teacher";
  var gender = "male";

  EmployeeProvider? provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<EmployeeProvider>(context,listen:true);
    return Scaffold(
      appBar: AppBar(
        title: Text("ApiExample1"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: " ENTER NAME"
              ),
              controller: _ename,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: "SALARY"
              ),
              controller: _salary,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),
              decoration:BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black26)
              ) ,
             
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Text("DEPARTMENT"),
                  SizedBox(width: 50,),
                  DropdownButton(
                    value: select,
                    onChanged: (val)
                    {
                      setState(() {
                        select = val!;
                        print(select);
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text("item1"),
                        value: "student",
                      ),
                      DropdownMenuItem(
                        child: Text("item2"),
                        value: "teacher",
                      ),
                      DropdownMenuItem(
                        child: Text("item3"),
                        value: "proffeser",
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
           Container(
             padding: EdgeInsets.all(10),
             decoration:BoxDecoration(
               // color: Colors.blue,
                 borderRadius: BorderRadius.circular(10),
                 border: Border.all(color: Colors.black26)
             ) ,

             height: 60,
             width: MediaQuery.of(context).size.width,
             child: Row(
               children: [
                 Text("GENDER :"),
                 SizedBox(width: 80,),
                 Text("Male"),
                 Radio(
                     value: "male",
                     groupValue: gender,
                     onChanged: (val){
                       setState(() {
                         gender = val!;
                       });
                     }
                 ),
                 Text("female"),
                 Radio(
                     value: "female",
                     groupValue: gender,
                     onChanged: (val){
                       setState(() {
                         gender = val!;
                       });
                     }
                 )
               ],
             ),
           ),
            ElevatedButton(
                onPressed: ()async{

                  var nm = _ename.text.toString();
                  var sal = _salary.text.toString();
                  var dropdon = select.toString();
                  var radio = gender.toString();

                  Map<String,String>prams={
                    "ename":nm,
                    "salary":sal,
                    "department":dropdon,
                    "gender":radio
                  };
                  await provider!.InseertEmployee(context, prams);
                  if(provider!.isinserted){
                    print("Employee Add");
                  }
                  else
                    {
                      print("No employee add");
                    }
                },
                child: Text("SUBMIT")
            )
          ],
        ),
      ),
    );
  }
}

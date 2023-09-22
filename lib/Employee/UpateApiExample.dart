import 'dart:convert';

import 'package:apiexample1/Employee/ViewApiExample1.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;

class UpateApiExample extends StatefulWidget {


  @override
  State<UpateApiExample> createState() => _UpateApiExampleState();
}

class _UpateApiExampleState extends State<UpateApiExample> {

  TextEditingController _ename = TextEditingController();
  TextEditingController _salary = TextEditingController();
  var select = "teacher";
  var gender = "male";
  data()async{

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UpateApiExample"),
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



                  Uri uri = Uri.parse("http://picsyapps.com/studentapi/insertEmployeeNormal.php");
                  var responce = await http.post(uri,body:
                  {
                    "ename":nm,
                    "salary":sal,
                    "department":dropdon,
                    "gender":radio
                  });

                  if(responce.statusCode==200)
                  {
                    var body = responce.body.toString();
                    print(body);

                    var jason = jsonDecode(body);

                    if(jason["status"]==true)
                    {
                      var msg = jason["message"].toString();
                      Fluttertoast.showToast(
                          msg: msg,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );

                    }
                    else
                    {
                      var msg = jason["message"].toString();
                      Fluttertoast.showToast(
                          msg: msg,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );

                    }
                  }
                  else
                  {
                    print("api error");
                  }
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewApiExample1()));

                },
                child: Text("SUBMIT")
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:apiexample1/Provider/EmployeeProvider.dart';
import 'package:apiexample1/Resource/UrlResorce.dart';
import 'package:apiexample1/helper/ApiHandler.dart';
import 'package:apiexample1/modal/employee.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewModalApiExample extends StatefulWidget {


  @override
  State<ViewModalApiExample> createState() => _ViewModalApiExampleState();
}

class _ViewModalApiExampleState extends State<ViewModalApiExample> {

  EmployeeProvider? provider;


  data()async{
    await provider!.ViewEmployee(context);

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider .of<EmployeeProvider>(context,listen: false);
   data();
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider .of<EmployeeProvider>(context,listen: true);
    return Scaffold(
       body: ListView.builder(
         itemCount:  provider!.getdata.length,
         itemBuilder: (context, index) {
           return Card(

             color: Colors.blue,
             margin: EdgeInsets.all(10),
             child: Column(
               // crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   children: [
                     Image.asset("img/2635417.png",height: 100,color: Colors.black,),
                     Column(
                       children: [
                         Text("EID :  "+provider!.getdata[index].eid.toString(),style: TextStyle(fontFamily: "Oswald",fontWeight: FontWeight.bold),),
                         Text("ENAME :  "+provider!.getdata[index].ename.toString(),style: TextStyle(fontFamily: "Oswald",fontWeight: FontWeight.bold),),

                       ],
                     ),
                     SizedBox(width: 70,),

                     Column(
                       children: [
                         IconButton(onPressed: (){
                           AlertDialog alert = AlertDialog(
                             title: Text("DELETE"),
                             content: Text("ARE YOU SURE"),
                             actions: [
                               ElevatedButton(onPressed: ()async{
                                 var id = provider!.getdata[index].eid.toString();
                                 print(id);

                                 Map<String,String>parms = {"eid":id};

                                await provider!.DeleteEmployee(context, parms);

                                if(provider!.isdelete)
                                {
                                  print("employee delete");
                                }
                                else
                                  {
                                    print("No Delete");
                                  }

                               }, child: Text("YES")),
                               ElevatedButton(onPressed: (){
                                 Navigator.of(context).pop();
                               }, child: Text("NO")),
                             ],
                           );
                           showDialog(context: context, builder: (context){
                             return alert;
                           });
                         },
                             icon: Icon(Icons.delete)
                         ),
                         IconButton(
                             onPressed: (){

                             },
                             icon: Icon(Icons.update)
                         ),
                       ],
                     )
                   ],
                 ),
                 Column(
                   children: [
                     Row(
                       children: [
                         SizedBox(width: 50,),
                         Text("SALARY :  "+provider!.getdata![index].salary.toString(),style: TextStyle(fontFamily: "Oswald",fontWeight: FontWeight.bold),),
                         SizedBox(width: 55,),
                         Text("DEPARTMEnT :  "+provider!.getdata![index].department.toString(),style: TextStyle(fontFamily: "Oswald",fontWeight: FontWeight.bold),),

                       ],
                     ),
                     Column(
                       children: [
                         Row(
                           children: [
                             SizedBox(width: 50,),
                             Text("GENDER :  "+provider!.getdata![index].gender.toString(),style: TextStyle(fontFamily: "Oswald",fontWeight: FontWeight.bold),),
                             SizedBox(width: 50,),
                             Text("DATETIME :  "+provider!.getdata![index].addedDatetime.toString(),style: TextStyle(fontFamily: "Oswald",fontWeight: FontWeight.bold),)
                           ],
                         )
                       ],
                     )



                   ],
                 ),


               ],
             ),
           );
         },

       )

    );
  }
}

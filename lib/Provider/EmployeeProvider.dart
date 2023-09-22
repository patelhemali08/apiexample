import 'dart:convert';
import 'package:apiexample1/Employee/ViewApiExample1.dart';
import 'package:apiexample1/Employee/ViewModalApiExample.dart';
import 'package:apiexample1/helper/ApiHandler.dart';
import 'package:apiexample1/modal/employee.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:apiexample1/Resource/UrlResorce.dart';
import 'package:flutter/cupertino.dart';

class EmployeeProvider with ChangeNotifier {
  var isinserted = false;
  var isdelete = false;

  late List<employee>getdata;
  ViewEmployee(context)async{
    await ApiHandler.get(UrlResorce.get_Employee).then((jason){
      getdata = jason["data"].map<employee>((alldata) => employee.fromJson(alldata)).toList();
      notifyListeners();
    });


  }

  InseertEmployee(context,prams)async{
     Uri uri = Uri.parse(UrlResorce.Insert_Employee,);
    print("uri :${uri}");
    var responce = await http.post(uri,body:prams);

    if(responce.statusCode==200)
    {
      var body = responce.body.toString();
      print(body);

      var jason = jsonDecode(body);

      if(jason["status"]=="true")
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
        isinserted = true;
        notifyListeners();

        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewModalApiExample()));

      }
      else
      {
        isinserted = false;
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


  }
  DeleteEmployee(context,parms)async{
   await ApiHandler.post(UrlResorce.Delete_Employee,body: parms).then((jason)
   {
     if(jason["status"]=="true")
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
       isdelete = true;
       notifyListeners();
       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewModalApiExample()));

     }
     else
     {
       isdelete = false;
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
   });
  }

}
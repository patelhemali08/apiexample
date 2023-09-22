import 'dart:convert';
import 'package:apiexample1/Employee/UpateApiExample.dart';
import 'package:apiexample1/Resource/UrlResorce.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;

import 'package:flutter/material.dart';

class ViewApiExample1 extends StatefulWidget {


  @override
  State<ViewApiExample1> createState() => _ViewApiExample1State();
}

class _ViewApiExample1State extends State<ViewApiExample1> {
  Future<List<dynamic>?>?alldata;
  Future<List<dynamic>?>?data()async{
    Uri uri = Uri.parse(UrlResorce.get_Employee);
    var responce = await http.get(uri);

    if (responce.statusCode == 200) {
      var body = responce.body.toString();
      var jason = jsonDecode(body);

      return jason["data"];
    }
    else {
      print("api arror");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      alldata = data();
    });
    data();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ViewApiExample1"),
      ),
      body: FutureBuilder(
        future: alldata,
        builder: (context, snapshot) {
          if(snapshot.hasData)
            {
              if(snapshot.data!.length<=0)
                {
                  return Center(child: Text("NO DATA"),);
                }
              else
                {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Card(

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
                                        Text("EID :  "+snapshot.data![index]["eid"].toString(),style: TextStyle(fontFamily: "Oswald",fontWeight: FontWeight.bold),),
                                        Text("ENAME :  "+snapshot.data![index]["ename"].toString(),style: TextStyle(fontFamily: "Oswald",fontWeight: FontWeight.bold),),

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
                                                var id = snapshot.data![index]["eid"].toString();
                                                print(id);

                                                Uri uri = Uri.parse(UrlResorce.Delete_Employee);
                                                var responce = await http.post(uri,body: {"eid":id});
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
                                                    print("Api Error");
                                                  }
                                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewApiExample1()));
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
                                              var id = snapshot.data![index]["eid"].toString();
                                              print(id);

                                              Navigator.of(context).push(
                                                  MaterialPageRoute(builder: (context)=>UpateApiExample()));
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
                                        Text("SALARY :  "+snapshot.data![index]["salary"].toString(),style: TextStyle(fontFamily: "Oswald",fontWeight: FontWeight.bold),),
                                        SizedBox(width: 55,),
                                        Text("DEPARTMEnT :  "+snapshot.data![index]["department"].toString(),style: TextStyle(fontFamily: "Oswald",fontWeight: FontWeight.bold),),

                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 50,),
                                            Text("GENDER :  "+snapshot.data![index]["gender"].toString(),style: TextStyle(fontFamily: "Oswald",fontWeight: FontWeight.bold),),
                                            SizedBox(width: 50,),
                                            Text("DATETIME :  "+snapshot.data![index]["added_datetime"].toString(),style: TextStyle(fontFamily: "Oswald",fontWeight: FontWeight.bold),)
                                          ],
                                        )
                                      ],
                                    )



                                  ],
                                ),


                              ],
                            ),
                          ),
                        );
                      },

                  );
                }
            }
          else
            {
              return Center(child: CircularProgressIndicator(),);
            }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class getapi extends StatefulWidget {


  @override
  State<getapi> createState() => _getapiState();
}

class _getapiState extends State<getapi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("getapi"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            Uri uri = Uri.parse("http://192.168.1.169/apiexample/getdataapi.php");
            var response = await http.get(uri);
            if(response.statusCode==200)
              {
                var body = response.body.toString();
                print(body);

              }
            else
              {
                print("api error");

              }
          },
          child: Text("SUBMIT"),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class PostData extends StatefulWidget {


  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {

  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PostData"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: "NAME"
            ),
            controller: _name,
            keyboardType: TextInputType.text,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: "password"
            ),
            controller: _password,
            keyboardType: TextInputType.text,
          ),
          ElevatedButton(
              onPressed: ()async{
                var nm = _name.text.toString();
                var pw = _password.text.toString();
                
                Uri uri = Uri.parse("http://172.20.10.2/apiexample/postdata.php");
                var responce = await http.post(uri,body:
                {
                  "name":nm,
                  "password":pw
                });

                if(responce.statusCode==200)
                  {
                    var body = responce.body.toString();
                    print(body);
                  }
                else
                  {
                    print("api error");
                  }
              },
              child:Text("SUBMIT")
          ),
        ],
      ),
    );
  }
}

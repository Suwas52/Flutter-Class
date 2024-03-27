import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Home extends StatelessWidget {
  const Home({super.key});

  getName() async {
    // https://www.fruityvice.com/api/fruit/all

    var url = Uri.https('www.fruityvice.com','api/fruit/all')
     var response = await http.get(url);

     if(response.statusCode == 200){
       var data = convert.jsonDecode(response.body);
       print(data);
     }
  }


  @override
  Widget build(BuildContext context) {

    // futureBuilder
    return FutureBuilder(
        future: getName(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            // after data is here
            return Text('Ok data ayo');
          }else{
            // while fetching data
            return CircularProgressIndicator();
          }
        });
  }
}





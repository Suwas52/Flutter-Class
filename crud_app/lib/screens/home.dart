import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({Key? key});

  getName() async {
    var url = Uri.https('www.dummyjson.com', '/carts');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      print('Number of books about http: $data.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
            print(snapshot.error);
          }
          // Data fetched successfully
          var data = snapshot.data;
          print(data);
          return Text('Data received: $data');
        } else {
          // while fetching data
          return CircularProgressIndicator();
        }
      },
    );
  }
}

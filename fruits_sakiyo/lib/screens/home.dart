import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({super.key});

  Future<dynamic> getName() async {
    var url = Uri.https('www.fruityvice.com', '/api/fruit/all');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);
    } else {
      throw Future.error("Error ayo");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            print(snapshot.error); // Print out the error message
            return Text('something went wrong');
          }

          var data = snapshot.data;
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (ctx, index) {
                return Container(
                  child: ListTile(
                    leading: Icon(Icons.dining_rounded),
                    title: Text(data[index]['name']),
                  ),
                );
              });
        } else {
          //waiting state
          return CircularProgressIndicator();
        }
      },
    );
  }
}

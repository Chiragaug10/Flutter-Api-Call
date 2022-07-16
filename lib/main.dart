import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final url = "https://jsonplaceholder.typicode.com/users";
  var postsjson = [];
  Future<void> fetchposts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsondata = jsonDecode(response.body) as List;
      print(jsondata);
      setState(() {
        postsjson = jsondata;
        print(postsjson);
      });
    } catch (e) {
      print("Something went wrong");
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    fetchposts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
            itemCount: postsjson.length,
            itemBuilder: (context, i) {
              final post = postsjson[i];
              return Text("\nUserName:-    " + post["username"]);
            }),
      ),
    );
  }
}

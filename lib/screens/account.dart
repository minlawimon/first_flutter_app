import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = "/account";

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: "Networking",
    //   home: NewsList()
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Container(
          child: Center(
        child: Text("Account Screen"),
      )),
    );
  }
}
import 'package:flutter/material.dart';
import './chatscreen.dart';


class Chat extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Girls Chat"),
      ),
      body: new ChatScreen()
    ); 
  }
}
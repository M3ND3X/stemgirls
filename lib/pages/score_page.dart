import 'package:flutter/material.dart';

import './landing_page.dart';
import '../main.dart';

class ScorePage extends StatelessWidget {

  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Your Score: ", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),),
          new Text(score.toString() + "/" + totalQuestions.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0)),
          new IconButton(
            icon: new Icon(Icons.refresh),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()), (Route route) => route == null)
          ),
          new IconButton(
          icon: new Icon(Icons.home, size: 50.0, color: Colors.white),
          onPressed: () {
              navigateToHome(context);
            },
          )
        ],
      )
    );
  }
}

Future navigateToHome(context)
async {
  Navigator.push(context,
  MaterialPageRoute(builder: (context) => MyTabs()));
}
import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './level2.dart';
import './level3.dart';

void main() {
  runApp(new MaterialApp(
    home: new Game()
  ));
}

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Game Levels")),
      body: new Container(
        padding: new EdgeInsets.all(30.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new IconButton(
              icon: new Icon(Icons.flag, size: 100.0, color: Colors.pink),
              onPressed: () {
                navigateToLevel1(context);
              },
            ),
            new IconButton(
              icon: new Icon(Icons.flag, size: 100.0, color: Colors.pink),
              onPressed: () {
                navigateToLevel2(context);
              },
            ),
            new IconButton(
              icon: new Icon(Icons.flag, size: 100.0, color: Colors.pink),
              onPressed: () {
                navigateToLevel3(context);
              },
            ),
            new IconButton(
              icon: new Icon(Icons.flag, size: 100.0, color: Colors.pink),
              onPressed: null
            )
          ]
        )
      )
    );
  }
}

Future navigateToLevel1(context)
async {
  Navigator.push(context,
  MaterialPageRoute(builder: (context) => LandingPage()));
}

Future navigateToLevel2(context)
async {
  Navigator.push(context,
  MaterialPageRoute(builder: (context) => PuzzleApp()));
}

Future navigateToLevel3(context)
async {
  Navigator.push(context,
  MaterialPageRoute(builder: (context) => TEF()));
}



class MyCard extends StatelessWidget {
  MyCard({this.icon});

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(15.0),
      child: new Card(
        child: new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Column(
            children: <Widget>[
              this.icon
            ]
          )
        )
      )
    );
  }
}

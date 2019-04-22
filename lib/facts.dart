import 'package:flutter/material.dart';


List<Color> bgcolors =[
  Colors.indigo[400],
  Colors.purple[200],
  Colors.red[300],
  Colors.green[300],
  Colors.teal[200],
  Colors.cyan[800],
  Colors.lime[700],
  Colors.deepPurple[400],
  Colors.brown[400],
  Colors.grey[500],
  Colors.blueAccent,
  Colors.blueGrey[400]

];

Color dispcolor = Colors.blue[400];

List<String> facts =[

" There are more lifeforms living on your skin than there are people on the planet.",
" The last letter added to the English alphabet wasn't Z — it was the letter J.",
" McDonalds calls frequent buyers of their food “heavy users.” ",
" You burn more calories sleeping than you do watching television.",
" For a short time, the planet Uranus was named...George.",
" For a brief time, Melbourne had the best name on the planet: Batmania.",
" In 1981, a black lab named Bosco was elected honorary mayor of Sunol, California.",
" If you somehow found a way to extract all of the gold from the bubbling core of our lovely little planet, you would be able to cover all of the land in a layer of gold up to your knees.",
" McDonalds calls frequent buyers of their food “heavy users.",
" The average person spends 6 months of their lifetime waiting on a red light to turn green.",];

String dispfact = "There are more lifeforms living on your skin than there are people on the planet.";

void main() => runApp(new MaterialApp(
      home: new Facts(),
      debugShowCheckedModeBanner: false,
    ));

class Facts extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Facts> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  int factcounter = 0;
  int colorcounter = 0;
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation = new CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    animation.addListener(() {
      this.setState(() {});
    });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void showfacts() {
    setState(() {
      dispfact = facts[factcounter];
      dispcolor = bgcolors[colorcounter];
      factcounter = factcounter < facts.length - 1 ? factcounter + 1 : 0;
      colorcounter = colorcounter < bgcolors.length - 1 ? colorcounter + 1 : 0;
      animationController.reset();
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: dispcolor,
      body: new Padding(
        padding: const EdgeInsets.symmetric(vertical: 75.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Align(
                  alignment: Alignment.topLeft,
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: new Text(
                      "Did you Know?",
                      style: new TextStyle(fontFamily: 'Pacifico', color: Colors.white, fontSize: 40.0, ),
                    ),
                  )),
              new Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0,top: 60.0),
                child: new Opacity(
                  opacity: animation.value*1,
                                  child: new Transform(
                    transform: new Matrix4.translationValues(0.0,animation.value*-50.0, 0.0),
                      child: new Text(
                    dispfact,
                    style: new TextStyle(
                        fontFamily: 'Acme',
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w300,
                        ),
                  )),
                ),
              ),
              new MaterialButton(
                shape: StadiumBorder(),
                color: Colors.white,
                minWidth: 160.0,
                child: new Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 18.0),
                  child: new Text(
                    "Show Another Fun Fact",
                    style: new TextStyle(fontSize: 20.0,color: dispcolor,fontFamily:'Satisfy'),
                  ),
                ),
                onPressed: showfacts,
              )
            ],
          ),
        ),
      ),
    );
  }
}

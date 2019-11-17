import 'package:app_flutter_myheros/home_page.dart';
import 'package:flutter/material.dart';

class DetalhesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 370.0,
                    child: Stack(
                      children: <Widget>[
                        new ClipRRect(
                          borderRadius: new BorderRadius.only(bottomLeft: const Radius.circular(130.0)),
                          child: Image.asset("assets/images/banner.png", fit: BoxFit.cover,),
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(top: 220.0, left: 95.0),
                            child: Column(
                              children: <Widget>[
                                Text("Justiceiro", style: TextStyle(fontSize: 45.0, color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 270.0,
                          left: 20.0,
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(0xFFE52020),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ScreenPart(),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

class ScreenPart extends StatelessWidget {
  List<String> images = [
    "assets/images/punisher.jpg",
    "assets/images/punisher.jpg",
    "assets/images/punisher.jpg",
    "assets/images/punisher.jpg"
  ];

  List<String> titles = ["Capitulo 1", "Capitulo 2", "Capitulo 3", "Capitulo 4"];

  List<Widget> movies() {
    List<Widget> movieList = new List();

    for (int i = 0; i < 4; i++) {
      var movieitem = Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 12.0),
        child: Container(
          height: 220.0,
          width: 135.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0))
              ]),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                child: Image.asset(
                  images[i],
                  width: double.infinity,
                  height: 130.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
                child: Text(titles[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: "SF-Pro-Display-Bold")),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(i == 0 ? "Temp. 1" : ""),
              )
            ],
          ),
        ),
      );
      movieList.add(movieitem);
    }
    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 360.0,
      margin: EdgeInsets.only(left: 15.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Assista agora",
                  style: TextStyle(
                      fontSize: 22.0, fontFamily: "SF-Pro-Display-Bold"),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: RaisedButton(
                    onPressed: () {
                      showAlertDialog1(context);
                    },
                    color: Color(0xFFE52020),
                    padding: EdgeInsets.symmetric(
                        vertical: 7.0, horizontal: 17.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Veja",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontFamily: "SF-Pro-Display-Bold"),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        RotatedBox(
                          quarterTurns: 2,
                          child: Icon(Icons.add,
                              size: 25.0, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 250.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: movies(),
            ),
          )
        ],
      ),
    );
  }
}

showAlertDialog1(BuildContext context)
{
  // configura o button
  Widget okButton = FlatButton(
    child: Text("Fechar"),
    onPressed: () { 
      Navigator.of(context).pop();
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Outras Capítulos", style: TextStyle(fontWeight: FontWeight.bold),),
    content: Container(
      height: 220.0,
      child: ListView(
        children: <Widget>[
          Text("Capitulo 05"),
          SizedBox(height: 20.0,),
          Text("Capitulo 06"),
          SizedBox(height: 20.0,),
          Text("Capitulo 07"),
          SizedBox(height: 20.0,),
          Text("Capitulo 08"),
          SizedBox(height: 20.0,),
          Text("Capitulo 09"),
          SizedBox(height: 20.0,),
          Text("Capitulo 10"),
        ],
      ),
    ),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}



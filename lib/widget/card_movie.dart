import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = 'https://www.superheroapi.com/api.php/3904302519595211/69';

class CardMovie extends StatefulWidget {
  @override
  _CardMovieState createState() => _CardMovieState();
}

class _CardMovieState extends State<CardMovie> {
  String nome;
  String image;
  String biography;
  String biography2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text("Carregando...",style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,),
              );
            default:
              if (snapshot.hasError){
                return Center(
                  child: Text(
                    "Erro ao carregar Dados.",
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                nome = snapshot.data['name'];
                image = snapshot.data['image']['url'];
                biography = snapshot.data['biography']['aliases'][0];
                biography2 = snapshot.data['biography']['aliases'][1];
                return SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 10.0),
                  child: Column(
                    children: <Widget>[
                      Text(nome,style: TextStyle(fontSize: 30.0),),
                      Text(biography),
                      Text(biography2),
                      Divider(height: 20.0,),
                      Image.network(image, height: 3git00.0,),
                    ],
                  ),
                );
              }
          };
        },
      ),
    );
  }
}

// Function para retornar dados da API
Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}


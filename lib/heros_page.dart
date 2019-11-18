import 'dart:convert';
import 'package:app_flutter_myheros/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:flutter/material.dart';

Future<Post> fetchPost() async {
  final response = await http.get('https://www.superheroapi.com/api.php/3904302519595211/732');

  if (response.statusCode == 200) {
    // se o servidor retornar um response OK, vamos fazer o parse no JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // se a responsta não for OK , lançamos um erro
    throw Exception('Failed to load post');
  }
}

class Post {
  final String nome;
  final String image;

  Post({this.nome, this.image});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      nome: json['name'],
      image: json['image']['url']
    );
  }
}

void main() => runApp(HerosPage(post: fetchPost()));

class HerosPage extends StatelessWidget {
  final Future<Post> post;
  HerosPage({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Post>(
          future: post,
          builder: (context, snapshot) {
            if (snapshot.hasData){
              return Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(snapshot.data.nome + snapshot.data.image),
              );
            } else if(snapshot.hasError){
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:superherowikiapp/super_hero_api.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LaunchScreen(),
        SuperHeroAPIPage.routeName: (context) => SuperHeroAPIPage(),
      },
    ),
  );
}

class LaunchScreen extends StatelessWidget {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oricle - Super Hero Wiki App',
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: myController,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (myController.text.isNotEmpty) Navigator.pushNamed(
                  context,
                 SuperHeroAPIPage.routeName,
                 arguments: SearchArguments(
                  //  '644'
                  // 'batman'
                  myController.text
                 ),
                );
              },
              child: Text('Search Oricle'),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchArguments {
  final String text;
  SearchArguments(this.text);
}

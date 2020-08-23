import 'dart:convert';

import 'package:coronatrackingapp/pages/stats/stats_nepal.dart';
import 'package:coronatrackingapp/pages/stats/stats_world.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Corona Tracking"),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Latest Updates (Nepal)",style: TextStyle(fontSize: 20),),
            ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
            child: Container(
              child: StatsNepal(),
            ),
          ),
            SizedBox(height: 20,),
            ListTile(
              title: Text("Latest Updates (World)",style: TextStyle(fontSize: 20),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
              child: Container(
                child: StatsWorld(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Myths extends StatefulWidget {
  @override
  _MythsState createState() => _MythsState();
}

class _MythsState extends State<Myths> {

  var myths;
  bool isLoading=true;

  Future getMyths() async{
    String url="https://nepalcorona.info/api/v1/myths";
    var response=await http.get(Uri.encodeFull(url),headers: {'Accept':'application/json'});
    setState(() {
      myths=json.decode(response.body)['data'];
      isLoading=false;
    });
  }

  @override
  void initState() {
    super.initState();
    getMyths();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Myths About CoronaVirus"),),
      body: isLoading==true?Center(child: CircularProgressIndicator(),):SingleChildScrollView(
        child: Column(
          children: <Widget>[

            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: myths.length-20,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Image.network(myths[index]['image_url']),
                        ],
                      ),
                    ),
                  );
                }
            )
          ],
        ),
      )
    );
  }
}

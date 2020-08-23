import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class News extends StatefulWidget {
  @override
  _MythsState createState() => _MythsState();
}

class _MythsState extends State<News> {

  var news;
  bool isLoading=true;

  Future getMyths() async{
    String url="https://nepalcorona.info/api/v1/news";
    var response=await http.get(Uri.encodeFull(url),headers: {'Accept':'application/json'});
    setState(() {
      news=json.decode(response.body)['data'];
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
        appBar: AppBar(title: Text("News"),),
        body: isLoading==true?Center(child: CircularProgressIndicator(),):SingleChildScrollView(
          child: Column(
            children: <Widget>[

              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: news.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Text(news[index]['title'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Image.network(news[index]['image_url']),
                            Text(news[index]['summary'])
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

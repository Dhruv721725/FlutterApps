import 'dart:convert';
import 'dart:io';

import 'package:baskets/pages/match_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; 

class HomePage extends StatelessWidget{
  HomePage({super.key});

  // get Teams
  Future currentMatches()async{
    var response = await http.get(Uri.https(
      "api.cricapi.com",  // ✅ No "https://"
      "/v1/matches",
      {
        "apikey": "cc4361d0-1fcf-4c27-adc8-6ba67b260646",
        "offset": "0",
      }
    ));
    //https://api.cricapi.com/v1/currentMatches?apikey=cc4361d0-1fcf-4c27-adc8-6ba67b260646&offset=0
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/cricket.png')
          ),
        ),
        title: Text("Cricket "),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: currentMatches(), 
              builder: (context, snapshot){
                if (snapshot.connectionState==ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator(),);
                }else{
                  return ListView.builder(
                    itemCount: snapshot.data["data"].length,
                    itemBuilder:(context, index) {
                      Map match=snapshot.data["data"][index];
                      
                      return GestureDetector(
                        
                        onTap:()=>Navigator.push(
                          context,MaterialPageRoute(
                            builder: (context) => MatchPage(match_id: match["id"])
                          )
                        ),
                        
                        child: Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: ListTile(
                            title: Text(match["name"].toString()),
                            subtitle: Text(
                              match["status"],
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.inversePrimary,
                                fontSize: 13,
                              ),  
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(DateFormat.yMMMd().format(
                                    DateTime.parse(match["dateTimeGMT"].toString()).toLocal()
                                  )),
                                Text(DateFormat.jm().format(
                                    DateTime.parse(match["dateTimeGMT"].toString()).toLocal()
                                  )),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            )
          )
        ],
      ),
    );
  }
}
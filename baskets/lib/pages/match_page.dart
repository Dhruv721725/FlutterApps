import 'dart:convert';

import 'package:baskets/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart'as http;
import 'package:intl/intl.dart';
class MatchPage extends StatelessWidget{
  String match_id;
  MatchPage({
    super.key,
    required this.match_id,
  });
  Future getMatch()async{
    http.Response response=await http.get(Uri.https(
      Api().apiAuth,
      Api().path["match"]!,
      {
      "apikey":Api().apiKey,
      "id":match_id
      }
    ));
    // print("https://${Api().apiAuth!+Api().path["match"]!+}")
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMatch(), 
      builder: (context,snapshot){
        if (snapshot.connectionState==ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }else if(snapshot.hasData){
          Map match=snapshot.data["data"];
          return Scaffold(
            appBar: AppBar(
              title: Text("${match["name"]}"),
            ),

            body: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text("Type: ${match["matchType"].split(",")[0]}"),
                  Text("Status: ${match["status"]}"),
                  Text("Venue: ${match["venue"]}"),
                  Row(
                    children: [
                      Text("Time: "),
                      Text('''${DateFormat.yMMMd().format(
                          DateTime.parse(match["dateTimeGMT"].toString()).toLocal()
                        )}, @'''),
                      Text(DateFormat.jm().format(
                          DateTime.parse(match["dateTimeGMT"].toString()).toLocal()
                        )),
                    ],
                  ),

                  match["status"].toString().toLowerCase()!="match not started"?Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Score board"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(match["teams"][0], textAlign: TextAlign.center,),
                              Text("Runs: ${match["score"][0]["r"]}"),
                              Text("Wicket: ${match["score"][0]["w"]}"),
                              Text("Over: ${match["score"][0]["o"]}"),
                            ],
                          ),
                          Text("VS"),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(match["teams"][1],textAlign: TextAlign.center,),
                              Text("Runs: ${match["score"][1]["r"]}"),
                              Text("Wicket: ${match["score"][1]["w"]}"),
                              Text("Over: ${match["score"][1]["o"]}"),
                            ],
                          )
                        ],
                      ),
                    ],
                  ):SizedBox()
                ],
              ),
            ),
          );
        }else{
          return AlertDialog(
            content: Text("no info available yet", textAlign: TextAlign.center,),
            actions: [
              IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back))
            ],
          );
        }
      }
    );
  }
}
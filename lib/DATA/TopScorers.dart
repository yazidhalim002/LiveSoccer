import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

 List _table=[];
class TopScorers extends StatefulWidget {
  final String code;
  const TopScorers({super.key,required this.code});

  @override
  State<TopScorers> createState() => _TopScorersState();
}

class _TopScorersState extends State<TopScorers> {


getTable() async {
    http.Response response1 = await http.get(
        Uri.parse('http://api.football-data.org/v4/competitions/${widget.code}/scorers'),
        headers: {'X-Auth-Token': 'a801894567f24f22a38d84e1e1b059ec'});
    String body = response1.body;
    Map data = jsonDecode(body);

    List Scorers = data['scorers'];

    setState(() {
      _table = Scorers;
    });
  }



   @override
  void initState() {
    super.initState();
    getTable();
  }


  @override
  Widget build(BuildContext context) {
    return _table == null
        ? Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 245, 245, 245),
                ),
              ),
            ),
          )
        : Scaffold(
            body: Stack(children: [

              SizedBox(height: 15),

              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 245, 245)),
                child: ListView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  'Pos',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Player',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'G',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'A',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'P',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                     buildTableTopScorers(),                
                  ],
                ),
              ),],
              
            ),
          );
  }
}







//Table of TopScorers for each league using API

Widget buildTableTopScorers() {
    List<Widget> players = [];
    int i=1;
    for (var player in _table) {
      players.add(Text(' '));
      players.add(
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(("$i ").toString()),
                    SizedBox(width: 30,),
                    Row(
                      children: [
                        Text(player['player']['name']),
                      ],
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    player['goals'].toString()=='null' ?   Text('0') :   Text(player['goals'].toString()),
                    player['assists'].toString()=='null'?   Text('0')  :  Text(player['assists'].toString()),
                    player['penalties'].toString()=='null'?   Text('0'):   Text(player['penalties'].toString()),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      
      i++;
    
    }
    
    return Column(
      children: players,
    );
  }
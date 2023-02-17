import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

List _table = [];

class Standing extends StatefulWidget {
  final String code;

  const Standing({super.key, required this.code});

  @override
  State<Standing> createState() => _StandingState();
}

class _StandingState extends State<Standing> {
  getTable() async {
    http.Response response1 = await http.get(
        Uri.parse(
            'http://api.football-data.org/v2/competitions/${widget.code}/standings'),
        headers: {'X-Auth-Token': 'a801894567f24f22a38d84e1e1b059ec'});
    String body = response1.body;
    Map data = jsonDecode(body);
    List standings = data['standings'][0]['table'];

    setState(() {
      _table = standings;
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
            body: Stack(
              children: [
                SizedBox(height: 15),
                Container(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 245, 245, 245)),
                  child: ListView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    'Pos',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Club',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'PL',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'W',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'D',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'L',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'GD',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Pts',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      buildTableStanding(),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

//Table of Standing for each league using API

Widget buildTableStanding() {
  List<Widget> teams = [];
  for (var team in _table) {
    teams.add(
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  team['position'].toString().length > 1
                      ? Text(team['position'].toString())
                      : Text(" " + team['position'].toString()),
                  Row(
                    children: [
                      SvgPicture.network(team['team']['crest'].toString(),
                          height: 40, width: 40),
                      team['team']['name'].toString().length > 20
                          ? Text(
                              team['team']['name'].toString().substring(0, 11) +
                                  '...')
                          : Text(team['team']['name'].toString()),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(team['playedGames'].toString()),
                  Text(team['won'].toString()),
                  Text(team['draw'].toString()),
                  Text(team['lost'].toString()),
                  Text(team['goalDifference'].toString()),
                  Text(team['points'].toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  return Column(
    children: teams,
  );
}

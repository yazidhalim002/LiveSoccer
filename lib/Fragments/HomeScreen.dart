import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../DATA/TableScreen.dart';
import 'package:http/http.dart' as http;

List _fixture = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Duration duration = Duration();
  Timer? timer;

  AllMatches() async {
    http.Response response1 = await http.get(
        Uri.parse('http://api.football-data.org/v4/matches'),
        headers: {'X-Auth-Token': 'a801894567f24f22a38d84e1e1b059ec'});
    String body = response1.body;
    Map data = jsonDecode(body);
    List Fixture = data["matches"];

    setState(() {
      _fixture = Fixture;
    });
  }

  @override
  void initState() {
    super.initState();
    AllMatches();
    startTime();
  }

  void addTime() {
    final addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      duration = Duration(seconds: seconds);
    });
  }

  void startTime() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  String Chrono() {
    String digital(int n) => n.toString().padLeft(2, '0');
    final minute = digital(duration.inMinutes.remainder(60));
    return minute;
  }

  Widget ALLmatches() {
    Color color;
    List<Widget> matches = [];
    for (var match in _fixture) {
      DateTime? time = DateTime.parse(match['utcDate']);
      bool isLive = match['status'] == "IN_PLAY";
      bool isPaused = match['status'] == "PAUSED";
      bool isTimed = match['status'] == "TIMED";
      bool isFinished = match['status'] == "FINISHED";
      int? elapsed;

      if (isLive) {
        color = Colors.green;
        elapsed = DateTime.now().difference(time).inMinutes;
        elapsed = isPaused ? elapsed - int.parse(Chrono()) : elapsed;
      } else if (isFinished) {
        color = Colors.red[200]!;
      } else {
        color = Color.fromARGB(174, 189, 189, 189);
      }
      matches.add(Center(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(3),
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color,
              ),
              child: Column(children: [
                Text(
                  isLive
                      ? "\n" + "$elapsed"
                      : isPaused
                          ? "\n" + "Half Time"
                          : isTimed
                              ? "\n" +
                                  match['utcDate'].toString().substring(11, 16)
                              : "\n" + match['status'],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text("  ${match['homeTeam']['shortName']}"),
                    Spacer(), // <-- add Spacer widget
                    Flexible(
                      child: Text(
                        isTimed ? " " : "${match['score']['fullTime']['home']}",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Text("  ${match['awayTeam']['shortName']}"),
                  Spacer(), // <-- add Spacer widget
                  Flexible(
                    child: Text(
                      isTimed ? " " : "${match['score']['fullTime']['away']}",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ]),
              ]),
            ),
          ),
        ),
      ));
    }
    return Container(
      height: 200,
      margin: EdgeInsets.only(top: 130),
      child: ListView(scrollDirection: Axis.horizontal, children: matches),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 246, 250, 1),
      appBar: AppBar(
        title: Text("LiveSoccer"),
        toolbarHeight: 52,
        backgroundColor: Color.fromRGBO(60, 93, 144, 1),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              child: Row(
                //spaceEvently make a small distance between the arguments
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TableScreen(code: 'PD'),
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 7, top: 18),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(160, 255, 0, 0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            )
                          ],
                        ),

                        // transform.scale make the image smaller or bigger as what do you want
                        child: Transform.scale(
                          scale: 0.73,
                          child: Image(
                              image: AssetImage('assets/league/LIGA.png'),
                              height: 20,
                              width: 20,
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TableScreen(code: 'PL'),
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 7, top: 18),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(199, 80, 69, 208),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            )
                          ],
                        ),
                        child: Transform.scale(
                          scale: 0.9,
                          child: Image(
                              image: AssetImage('assets/league/PRLEAGUE.png'),
                              height: 20,
                              width: 20,
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TableScreen(code: 'SA'),
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 7, top: 18),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(244, 72, 192, 229),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            )
                          ],
                        ),
                        child: Transform.scale(
                          scale: 0.83,
                          child: Image(
                              image: AssetImage('assets/league/SERIE-A.png'),
                              height: 20,
                              width: 20,
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TableScreen(code: 'FL1'),
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 7, top: 18),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(181, 66, 140, 227),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              )
                            ],
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/league/ligue-1.png'))),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TableScreen(code: 'BL1'),
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 7, top: 18),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(145, 60, 93, 144),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            )
                          ],
                        ),
                        child: Transform.scale(
                          scale: 0.8,
                          child: Image(
                              image: AssetImage('assets/league/BANDESLIGA.png'),
                              height: 20,
                              width: 20,
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 100, left: 10),
                    child: FaIcon(
                      FontAwesomeIcons.fireFlameCurved,
                      size: 21,
                    )),
                Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Text(
                      '  Most Fixture',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color.fromARGB(255, 83, 92, 101)),
                    )),
              ],
            ),

            //Fixture matches

            ALLmatches(),

            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 350, left: 10),
                    child: FaIcon(
                      FontAwesomeIcons.newspaper,
                      size: 21,
                    )),
                Container(
                    margin: EdgeInsets.only(top: 350),
                    child: Text(
                      ' News',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color.fromARGB(255, 83, 92, 101)),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

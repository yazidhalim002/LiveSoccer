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

      bool isHomeTeamPng =
          match['homeTeam']['crest'].toString().contains('png');
      bool isAwayTeamPng =
          match['awayTeam']['crest'].toString().contains('png');

      if (isLive) {
        color = Colors.green;
        elapsed = DateTime.now().difference(time).inMinutes;
        elapsed = isPaused ? elapsed - int.parse(Chrono()) : elapsed;
      } else if (isFinished) {
        color = Colors.red[200]!;
      } else {
        color = Color.fromARGB(174, 189, 189, 189);
      }
      if (match['competition']['code'] == "PD" ||
          match['competition']['code'] == "PL" ||
          match['competition']['code'] == "SA" ||
          match['competition']['code'] == "FL1" ||
          match['competition']['code'] == "BL1" ||
          match['competition']['code'] == "CL" ||
          match['competition']['code'] == "EC") {
        matches.add(Center(
          child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 11),
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 11, 21, 5),
                width: 335,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(112, 117, 117, 117),
                          spreadRadius: 1,
                          blurRadius: 15)
                    ]),
                child: Column(children: [
                  isLive
                      ? Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 7),
                              child: Text(
                                "LIVE",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    fontSize: 18),
                              ),
                            ),
                          ]),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            match['utcDate'].toString().substring(11, 16),
                            style: GoogleFonts.comfortaa(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                            width: 50,
                            height: 50,
                            child: isHomeTeamPng
                                ? Image.network(
                                    match['homeTeam']['crest'],
                                    height: 50,
                                    width: 50,
                                  )
                                : SvgPicture.network(
                                    match['homeTeam']['crest'],
                                    height: 50,
                                    width: 50,
                                  )),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 24, 24, 0),
                          child: isLive
                              ? Text(
                                  '${match['score']['fullTime']['home']}   -    ${match['score']['fullTime']['away']}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    height: 1.5,
                                    color: Color(0xff000000),
                                  ),
                                )
                              : Text(
                                  '          -         ',
                                  style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    height: 1.5,
                                    color: Color(0xff000000),
                                  ),
                                ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0.86),
                            child: isAwayTeamPng
                                ? Image.network(
                                    match['awayTeam']['crest'],
                                    height: 50,
                                    width: 50,
                                  )
                                : SvgPicture.network(
                                    match['awayTeam']['crest'],
                                    height: 50,
                                    width: 50,
                                  )),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 67,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          '${match['homeTeam']['shortName']}',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 110),
                        child: Text(
                          '${match['awayTeam']['shortName']}',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ],
                  )
                ]),
              )),
        ));
      }
    }
    return Container(
      height: 200,
      margin: EdgeInsets.only(top: 200),
      child: ListView(scrollDirection: Axis.horizontal, children: matches),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50),
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
                                image:
                                    AssetImage('assets/league/BANDESLIGA.png'),
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
                      margin: EdgeInsets.only(top: 150, left: 10),
                      child: FaIcon(
                        FontAwesomeIcons.fireFlameCurved,
                        size: 21,
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 150),
                      child: Text(
                        '  Upcoming Match',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                            color: Color(0xff000000)),
                      )),
                ],
              ),

              //Fixture matches

              ALLmatches(),

              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 420, left: 10),
                      child: FaIcon(
                        FontAwesomeIcons.newspaper,
                        size: 21,
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 420),
                      child: Text(
                        ' News',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                            color: Color(0xff000000)),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

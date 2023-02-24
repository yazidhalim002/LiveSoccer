import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

List _fixture = [];

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int selectedDay = 6;

  getMatches({required String dateMatch}) async {
    http.Response response1 = await http.get(
        Uri.parse('http://api.football-data.org/v4/matches?date=$dateMatch'),
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
  }

  Widget ALLmatches() {
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

      if (match['competition']['code'] == "PD" ||
          match['competition']['code'] == "PL" ||
          match['competition']['code'] == "SA" ||
          match['competition']['code'] == "FL1" ||
          match['competition']['code'] == "BL1" ||
          match['competition']['code'] == "CL" ||
          match['competition']['code'] == "EC") {
        matches.add(GestureDetector(
          onTap: () {},
          child: Center(
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
                            blurRadius: 10)
                      ]),
                  child: Column(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isLive
                            ? Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 25,
                                width: 70,
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
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 3),
                                    child: Text(
                                      "LIVE",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                          fontSize: 16),
                                    ),
                                  ),
                                ]),
                              )
                            : isTimed
                                ? Center(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 25),
                                      child: Text(
                                        match['utcDate']
                                            .toString()
                                            .substring(11, 16),
                                        style: GoogleFonts.comfortaa(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 25),
                                      child: Text(
                                        "FINISHED",
                                        style: GoogleFonts.comfortaa(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                child: Text(
                                  '${match['homeTeam']['shortName']}',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
                            child: isLive
                                ? Row(
                                    children: [
                                      Text(
                                        '${match['score']['fullTime']['home']}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      Text(
                                        '  -  ',
                                        style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      Text(
                                        '${match['score']['fullTime']['away']}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  )
                                : isTimed
                                    ? Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 10),
                                            child: Text(
                                              '-',
                                              style: GoogleFonts.poppins(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w700,
                                                height: 1.5,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          match['score']['fullTime']['home'] > match['score']['fullTime']['away']
                                              ? Text(
                                                  '${match['score']['fullTime']['home']}',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.5,
                                                    color: Color.fromARGB(
                                                        255, 81, 223, 56),
                                                  ),
                                                )
                                              : Text(
                                                  '${match['score']['fullTime']['home']}',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.5,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                          Text(
                                            '  -  ',
                                            style: GoogleFonts.poppins(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700,
                                              height: 1.5,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                          match['score']['fullTime']['home'] <
                                                  match['score']['fullTime']
                                                      ['away']
                                              ? Text(
                                                  '${match['score']['fullTime']['away']}',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.5,
                                                    color: Color.fromARGB(
                                                        255, 81, 223, 56),
                                                  ),
                                                )
                                              : Text(
                                                  '${match['score']['fullTime']['away']}',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.5,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                        ],
                                      ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0.86),
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
                                      ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                child: Text(
                                  '${match['awayTeam']['shortName']}',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                )),
          ),
        ));
      }
    }
    return matches != null
        ? Container(
            height: 200,
            margin: EdgeInsets.only(top: 150),
            child:
                ListView(scrollDirection: Axis.horizontal, children: matches))
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LiveSoccer"),
        toolbarHeight: 52,
        backgroundColor: Color.fromRGBO(60, 93, 144, 1),
      ),
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      body: Container(
        child: Stack(children: [
          Container(
            height: 60,
            color: Colors.white70,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  var date = DateTime.now().add(Duration(days: index - 6));
                  var formattedDate = DateFormat("dd MMM").format(date);

                  String dateMatch = DateFormat("yyyy-MM-dd").format(date);

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDay = index;
                          getMatches(dateMatch: dateMatch);
                        });
                      },
                      child: Center(
                        child: Text(
                          formattedDate,
                          style: TextStyle(
                            fontSize: selectedDay != index ? 14 : 16,
                            color: selectedDay == index
                                ? Colors.blue
                                : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 100,
          ),
          ALLmatches(),
        ]),
      ),
    );
  }
}

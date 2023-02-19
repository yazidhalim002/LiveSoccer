import 'dart:convert';

import 'package:flutter/material.dart';
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

  getAllMatches() async {
    http.Response response1 = await http.get(
        Uri.parse('https://api.football-data.org/v4/matches'),
        headers: {'X-Auth-Token': 'a801894567f24f22a38d84e1e1b059ec'});
    String body = response1.body;
    Map data = jsonDecode(body);
    List standings = data["matches"];

    setState(() {
      _fixture = standings;
    });
  }

  String datevar = '';

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

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDay = index;
                          print(datevar);
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
        ]),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livesoccer/AppBar_icons/IPTV.dart';
import '../DATA/TableScreen.dart';
import 'package:http/http.dart' as http;
List _fixture = [];
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  getAllMatches() async {
    http.Response response1 = await http.get(
        Uri.parse('http://api.football-data.org/v4/matches'),
        headers: {'X-Auth-Token': 'a801894567f24f22a38d84e1e1b059ec'});
   
    String body = response1.body;
    Map data = jsonDecode(body);
    List standings = data["matches"];
    print(standings);
    
    setState(() {
      _fixture = standings;
    });

  }


    @override
  void initState() {
    super.initState();
    getAllMatches();
    
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245 ,246 ,250,1),
      appBar: AppBar(
        title: Text("LiveSoccer"),
        toolbarHeight: 52,
        backgroundColor: Color.fromRGBO(60, 93, 144, 1),
        actions: [
          IconButton(icon: const Icon(Icons.tv),onPressed: () {
             Navigator.push(
                  context, 
                MaterialPageRoute(
                  builder: (context)=> IPTV(),
                ));
          },)
        ],
      ),
    body: SingleChildScrollView(
      child: Stack(children: [
        Container(
           child: Row(
            //spaceEvently make a small distance between the arguments
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, 
                  MaterialPageRoute(
                    builder: (context)=> TableScreen(code:'PD'),
                  ));
                },
                          child: Padding(
                            padding: EdgeInsets.only(left: 7,top: 18),
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
                                             fit: BoxFit.fill
                                    ),
                                  ),
                              ),
                            
                          ),
                        ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, 
                  MaterialPageRoute(
                    builder: (context)=> TableScreen(code:'PL'),
                  )
                    
                  );
                },
                          child: Padding(
                            padding: EdgeInsets.only(left: 7,top: 18),
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
                                             fit: BoxFit.fill
                                    ),
                                  ),
                            ),
                          ),
                        ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, 
                  MaterialPageRoute(
                    builder: (context)=> TableScreen(code:'SA'),
                  ));
                },
                          child: Padding(
                            padding: EdgeInsets.only(left: 7,top: 18),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(244,72, 192, 229),
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
                                               fit: BoxFit.fill
                                                               ),
                                  ),
                            ),
                          ),
                        ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, 
                  MaterialPageRoute(
                    builder: (context)=> TableScreen(code:'FL1'),
                  ));
                },
                          child: Padding(
                            padding: EdgeInsets.only(left: 7,top: 18),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(181,66, 140, 227),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 2),
                                      blurRadius: 6.0,
                                    )
                                  ],
                                  image: DecorationImage(
                                      image: AssetImage('assets/league/ligue-1.png'))),
                            ),
                          ),
                        ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, 
                  MaterialPageRoute(
                    builder: (context)=> TableScreen(code:'BL1'),
                  ));
                },
                          child: Padding(
                            padding: EdgeInsets.only(left: 7,top: 18),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(145,60, 93, 144),
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
                                             fit: BoxFit.fill
                                    ),
                                  ),
                            ),
                          ),
                        ),
            ],
           ),
        ),
      
      
        //Fixture matches
                    Row(
                      children: [
                        
                        Container(
                          margin: EdgeInsets.only(top: 100,left: 10),
                          child: FaIcon(
                        FontAwesomeIcons.fireFlameCurved,
                        size: 21,)
                      ),
                      Container(
                      margin: EdgeInsets.only(top: 100),
                      child: Text('  Most Fixture',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold,
                              fontSize: 17,color: Color.fromARGB(255, 83, 92, 101)),)
                      ),
                      ],
                    ),
                    
          ALLmatches()
      ],
      ),
    ),
    );
      
  }
  }







Widget ALLmatches(){
List<Widget> matches= [];
    for (var match in _fixture) {
      matches.add(
        Center(
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.all(3),
                  width: 200,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.grey),
                  child: Column(children: [
                    Text(match['utcDate'].toString().substring(11,16)),
                    SizedBox(height: 15,),
                    Row(children: [
                      Text("  ${match['homeTeam']['shortName']}                        ${match['score']['fullTime']['home']}"),
                    ],),

                    SizedBox(height: 15,),
                    
                    Row(children: [
                      Text("  ${match['awayTeam']['shortName']}"),
SizedBox(width: 115,),
                      Row(children: [
                       Text("${match['score']['fullTime']['away']}")
                    ],)
                    ]),
                    
                    

                    
                  ]),
              ),
            ),
            
            ),
        )
      );
    }
    return Container(
          height: 200,
          margin: EdgeInsets.only(top: 130),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: matches
          ),
        );
        //  return SingleChildScrollView(
        //    child: Column(
        //        children: matches,
        //      ),
         
}
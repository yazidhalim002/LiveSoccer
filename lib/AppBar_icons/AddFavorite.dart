import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:livesoccer/AppBar_icons/Teams.dart';

class AddFavorite extends StatefulWidget {
  const AddFavorite({super.key});

  @override
  State<AddFavorite> createState() => _AddFavoriteState();
}

class _AddFavoriteState extends State<AddFavorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245 ,246 ,250,1),
      appBar: AppBar(
        title: Text("LiveSoccer"),
        toolbarHeight: 52,
        backgroundColor: Color.fromRGBO(60, 93, 144, 1)),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(children: [
            Card(
              child: ListTile(
                onTap: (){
                  Navigator.push(
                  context, 
                MaterialPageRoute(
                  builder: (context)=> TeamsScreen(code:'PD'),
                ));
                },
                title: Text('La LIGA'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Transform.scale(
                                  scale: 0.73,
                                  child: Image(
                                          image: AssetImage('assets/league/LIGA.png'),
                                           height: 50,
                                           width: 50,
                                           fit: BoxFit.fill
                                  ),
                                ),     
              ),
            ),
            Card(
              child: ListTile(
                onTap: (){
                  Navigator.push(
                  context, 
                MaterialPageRoute(
                  builder: (context)=> TeamsScreen(code:'PL'),
                ));
                },
                title: Text('PREMIER LEAGUE'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Transform.scale(
                                  scale: 0.73,
                                  child: Image(
                                          image: AssetImage('assets/league/PRLEAGUE.png'),
                                           height: 50,
                                           width: 50,
                                           fit: BoxFit.fill
                                  ),
                                ),     
              ),
            ),
            Card(
              child: ListTile(
                onTap: (){
                  Navigator.push(
                  context, 
                MaterialPageRoute(
                  builder: (context)=> TeamsScreen(code:'SA'),
                ));
                },
                title: Text('SERIE A'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Transform.scale(
                                  scale: 0.73,
                                  child: Image(
                                          image: AssetImage('assets/league/SERIE-A.png'),
                                           height: 50,
                                           width: 50,
                                           fit: BoxFit.fill
                                  ),
                                ),     
              ),
            ),
            Card(
              child: ListTile(
                onTap: (){
                  Navigator.push(
                  context, 
                MaterialPageRoute(
                  builder: (context)=> TeamsScreen(code:'FL1'),
                ));
                },
                title: Text('LIGUE 1'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Transform.scale(
                                  scale: 0.73,
                                  child: Image(
                                          image: AssetImage('assets/league/ligue-1.png'),
                                           height: 50,
                                           width: 50,
                                           fit: BoxFit.fill
                                  ),
                                ),     
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                  context, 
                MaterialPageRoute(
                  builder: (context)=> TeamsScreen(code:'BL1'),
                ));
                },
                title: Text('BANDESLIGA'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Transform.scale(
                                  scale: 0.73,
                                  child: Image(
                                          image: AssetImage('assets/league/BANDESLIGA.png'),
                                           height: 50,
                                           width: 50,
                                           fit: BoxFit.fill
                                  ),
                                ),     
              ),
            )
          ],
          ),
        ),

    );
  }
}
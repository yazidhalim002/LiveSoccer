import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


List _table=[];
class TeamsScreen extends StatefulWidget {
  final String code;
  const TeamsScreen({super.key, required this.code});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
 List<Widget> _favoriteTeams = [];
  List _table = [];

   getTable() async {
    http.Response response1 = await http.get(
        Uri.parse('http://api.football-data.org/v2/competitions/${widget.code}/teams'),
        headers: {'X-Auth-Token': 'a801894567f24f22a38d84e1e1b059ec'});
    String body = response1.body;
    Map data = jsonDecode(body);
    List standings = data['teams'];

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
  return Scaffold(
    backgroundColor: Color.fromRGBO(245, 246, 250, 1),
    appBar: AppBar(
        title: Text("LiveSoccer"),
        toolbarHeight: 52,
        backgroundColor: Color.fromRGBO(60, 93, 144, 1),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView(
                    children: _favoriteTeams,
                  );
                },
              );
            },
          )
        ]),
    body: Container(
      child: Teams(),
    ),
  );
}



Widget Teams() {
  List<Widget> teams = [];

  for (var team in _table) {
    bool isFavorite = _favoriteTeams.any((favorite) => favorite.key == ValueKey(team['id']));

    teams.add(
      Card(
        child: ListTile(
          title: Text(team['name'].toString()),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                if (isFavorite) {
                  _favoriteTeams.removeWhere((favorite) => favorite.key == ValueKey(team['id']));
                } else {
                  _favoriteTeams.add(ListTile(
                    key: ValueKey(team['id']),
                    title: Text(team['name'].toString()),
                    leading: Transform.scale(
                      scale: 0.73,
                      child: SvgPicture.network(team['crestUrl'].toString(), height: 30, width: 30),
                    ),
                  ));
                }
              });
            },
            icon: isFavorite
                ? const Icon(Icons.favorite, color: Colors.red)
                : const Icon(Icons.favorite_border_outlined),
          ),
          leading: Transform.scale(
            scale: 0.73,
            child: SvgPicture.network(team['crestUrl'].toString(), height: 30, width: 30),
          ),
        ),
      ),
    );
  }

  return SingleChildScrollView(
    child: Column(
      children: teams,
    ),
  );
}
}
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:livesoccer/DATA/Data.dart';
import 'package:provider/provider.dart';

List _table = [];

class TeamsScreen extends StatefulWidget {
  final String code;
  const TeamsScreen({super.key, required this.code});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  List<Widget> _favoriteTeams = [];
  List<Data> dataList = [];
  final user = FirebaseAuth.instance.currentUser!;

  late DatabaseReference dbRef;

  getTable() async {
    http.Response response1 = await http.get(
        Uri.parse(
            'http://api.football-data.org/v2/competitions/${widget.code}/teams'),
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
    dbRef = FirebaseDatabase.instance.ref();
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
      body: Container(
        child: Teams(),
      ),
    );
  }

  Widget Teams() {
    List<Widget> teams = [];

    for (var team in _table) {
      bool isPng = team['crestUrl'].toString().contains('png');
      bool isFavorite = _favoriteTeams
          .any((favorite) => favorite.key == ValueKey(team['id']));
      String teamId = team['id'].toString();

      teams.add(
        Card(
          child: ListTile(
            title: Text(team['name'].toString()),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  if (isFavorite) {
                    _favoriteTeams.removeWhere(
                        (favorite) => favorite.key == ValueKey(team['id']));

                    dbRef.child(user.uid).child(user.uid).remove();
                  } else {
                    _favoriteTeams.add(ListTile(
                      key: ValueKey(team['id']),
                      title: Text(team['name'].toString()),
                      leading: Transform.scale(
                        scale: 0.73,
                        child: isPng
                            ? Image.network(
                                team['crestUrl'].toString(),
                                height: 30,
                                width: 30,
                              )
                            : SvgPicture.network(
                                team['crestUrl'].toString(),
                                height: 30,
                                width: 30,
                              ),
                      ),
                    ));

                    Map<String, String> FavTeams = {
                      'id': '${team['id']}',
                      'name': '${team['name']}',
                      'user': '${user.email}',
                      'crest': '${team['crestUrl']}'
                    };

                    dbRef.child(user.uid).child(teamId).set(FavTeams);
                  }

                  // Remove the card from the _table list
                  _table.remove(team);
                });
              },
              icon: const Icon(Icons.favorite_border_outlined),
            ),
            leading: Transform.scale(
              scale: 0.73,
              child: isPng
                  ? Image.network(team['crestUrl'].toString(),
                      height: 30, width: 30)
                  : SvgPicture.network(team['crestUrl'].toString(),
                      height: 30, width: 30),
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

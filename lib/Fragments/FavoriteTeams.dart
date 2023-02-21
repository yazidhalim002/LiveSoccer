import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:livesoccer/AppBar_icons/AddFavorite.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Favorite_Teams');

  late DatabaseReference DatabaseRef;
  late Map favoriteTeams;

  final user = FirebaseAuth.instance.currentUser!;
  @override
  void initState() {
    super.initState();
    DatabaseRef = FirebaseDatabase.instance.ref().child('Favorite_Teams');
  }

  Widget favorite({required Map favorite_teams}) {
    bool isPng = favorite_teams['crest'].toString().contains('png');
    return user.email == favorite_teams['user']
        ? Card(
            child: ListTile(
              title: Text(favorite_teams['name']),
              trailing: IconButton(
                  icon: const Icon(Icons.delete_sweep_sharp),
                  onPressed: () {
                    DatabaseRef.child(favorite_teams['key'].toString())
                        .remove()
                        .then((_) {
                      setState(() {
                        // Remove the team from the local list as well
                        favoriteTeams.remove(favorite_teams['key']);
                      });
                    });
                  }),
              leading: Transform.scale(
                scale: 0.73,
                child: isPng
                    ? Image.network(favorite_teams['crest'],
                        height: 30, width: 30)
                    : SvgPicture.network(favorite_teams['crest'],
                        height: 30, width: 30),
              ),
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        appBar: AppBar(
          title: Text("LiveSoccer"),
          toolbarHeight: 52,
          backgroundColor: Color.fromRGBO(60, 93, 144, 1),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddFavorite(),
                    ));
              },
            )
          ],
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map favorite_teams = snapshot.value as Map;
              favorite_teams['key'] = snapshot.key;

              return favorite(favorite_teams: favorite_teams);
            },
          ),
        ));
  }
}

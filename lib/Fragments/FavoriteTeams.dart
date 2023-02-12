import 'package:flutter/material.dart';
import 'package:livesoccer/AppBar_icons/AddFavorite.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        appBar: AppBar(
        title: Text("LiveSoccer"),
        toolbarHeight: 52,
        backgroundColor: Color.fromRGBO(60, 93, 144, 1),
        actions: [
          IconButton(icon: const Icon(Icons.add),onPressed: () {
             Navigator.push(
                  context, 
                MaterialPageRoute(
                  builder: (context)=> AddFavorite(),
                ));
          },)
        ],
      ),
        body:Container()
        
        );
  }
}
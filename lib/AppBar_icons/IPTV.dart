import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class IPTV extends StatefulWidget {
  const IPTV({super.key});

  @override
  State<IPTV> createState() => _IPTVState();
}

class _IPTVState extends State<IPTV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        appBar: AppBar(
        title: Text("LiveSoccer"),
        toolbarHeight: 52,
        backgroundColor: Color.fromRGBO(60, 93, 144, 1),),
        
        body: ListView(children: [
          SizedBox(height: 15,),
          Card(
              shadowColor: Colors.black,
            elevation: 10,
              child: ListTile(
                onTap: (){
                },
                title: Center(child: Text('beIN SPORTS (1080P)')),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),


           Card(
              shadowColor: Colors.black,
            elevation: 10,
              child: ListTile(
                onTap: (){
                },
                title: Center(child: Text('beIN SPORTS (720P)')),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),


             Card(
              shadowColor: Colors.black,
            elevation: 10,
              child: ListTile(
                onTap: (){
                },
                title: Center(child: Text('beIN SPORTS (480P)')),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),


             Card(
              shadowColor: Colors.black,
            elevation: 10,
              child: ListTile(
                onTap: (){
                },
                title: Center(child: Text('beIN SPORTS (360P)')),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),


             Card(
              shadowColor: Colors.black,
            elevation: 10,
              child: ListTile(
                onTap: (){
                },
                title: Center(child: Text('beIN SPORTS (240P)')),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),


             Card(
              shadowColor: Colors.black,
            elevation: 10,
              child: ListTile(
                onTap: (){
                },
                title: Center(child: Text('beIN SPORTS (144P)')),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),

             Card(
              shadowColor: Colors.black,
            elevation: 10,
              child: ListTile(
                onTap: (){
                },
                title: Center(child: Text('MOROCCAN CHANNELS')),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
        ],)
        
        );
        
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:livesoccer/DATA/Standing.dart';
import 'package:livesoccer/DATA/TopScorers.dart';

class TableScreen extends StatefulWidget {
  final String code;

  const TableScreen({super.key, required this.code});
 
  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {

  String _selectedValue = 'Standings';
  final List _values = ["Standings","Top Scorers"];

  
  Widget _buildTable() {
    switch (_selectedValue) {
      case 'Standings':
        return Standing(code: widget.code);
      case 'Top Scorers':
        return TopScorers(code: widget.code);
      default:
        return Container();
    }
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButton(
              value: _selectedValue,
              isExpanded: false,
              icon: Icon(Icons.arrow_drop_down),
              dropdownColor: Colors.grey[200],
              onChanged: (newValue) {
                setState(() {
                  _selectedValue = newValue.toString();
                });
              },
              items: _values.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: _buildTable(),
          ),
        ],
      ),
    );
  }
}
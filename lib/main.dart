import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'roll_dices.dart';
import 'random_number.dart';
import 'dart:math';
import 'random_from_list.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                  child: Icon(FontAwesomeIcons.diceD20)),
              Text(
                'Randomizer',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 30.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          bottom: TabBar(
            tabs: [
              //Tab(icon: Icon(FontAwesomeIcons.dice)),
              Tab(icon: Icon(FontAwesomeIcons.slackHash)),
              Tab(icon: Icon(FontAwesomeIcons.list)),
            ],
          ),
        ),

        body: TabBarView(
          children: [
			RollDices(),
            RandomNumber(),
            RandomFromList(),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'roll_dices.dart';


void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                child: Icon(FontAwesomeIcons.dice)),
            Text(
              'Roll the dices',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 30.0,
                letterSpacing: 3.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: RollDices(),
    );
  }
}
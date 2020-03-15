import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class RollDices extends StatefulWidget {
  @override
  _RollDicesState createState() => _RollDicesState();
}

class _RollDicesState extends State<RollDices> {
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
    Random randomNumber = new Random();
    int next(int min, int max) => min + randomNumber.nextInt(max + 1 - min);
    IconData randomIconDice1 = rollDice(next(1,6));
    IconData randomIconDice2 = rollDice(next(1,6));
    return FlatButton(
      onPressed: (){
        setState(() {
          randomIconDice1 = rollDice(next(1,6));
          randomIconDice2 = rollDice(next(1,6));
        });
      },
      child: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex:5,
              child: Icon(
                randomIconDice1,
                size: 200,
              ),
            ),
            Expanded(
              flex:5,
              child: Icon(
                randomIconDice2,
                size: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

IconData rollDice(int number) {
  switch (number) {
    case 1:
      return FontAwesomeIcons.diceOne;
    case 2:
      return FontAwesomeIcons.diceTwo;
    case 3:
      return FontAwesomeIcons.diceThree;
    case 4:
      return FontAwesomeIcons.diceFour;
    case 5:
      return FontAwesomeIcons.diceFive;
    case 6:
      return FontAwesomeIcons.diceSix;
    default:
      return FontAwesomeIcons.diceSix;
  }
}
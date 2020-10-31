import 'package:flutter/material.dart';
import 'dart:math';

class RandomNumber extends StatefulWidget {
  @override
  _RandomNumberState createState() => _RandomNumberState();
}

final minNumber = TextEditingController();
final maxNumber = TextEditingController();

class _RandomNumberState extends State<RandomNumber> {
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
    final focus = FocusNode();
    Random randomNumber = new Random();
    int next(int min, int max) => (min + randomNumber.nextInt(max + 1 - min));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text(
            'Random number',
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: <Widget>[
            Text(
              'Minimum number:',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              width: 100.0,
              child: new TextField(
                textInputAction: TextInputAction.next,
                controller: minNumber,
                decoration: InputDecoration(hintText: 'Min #'),
                keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                onSubmitted: (v){
                  FocusScope.of(context).requestFocus(focus);
                },
              ),
            ),
            Text(
              'Maximum number:',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              width: 100.0,
              child: new TextField(
                focusNode: focus,
                controller: maxNumber,
                decoration: InputDecoration(hintText: 'Max #'),
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: false),
              ),
            ),
            RaisedButton(
                color: Colors.blue[300],
                onPressed: () {

                  String content;

                  int minN = int.tryParse(minNumber.text);
                  int maxN = int.tryParse(maxNumber.text);

                  if(minN!=null && maxN!=null){
                    if(maxN>minN){
                      FocusScope.of(context).requestFocus(new FocusNode());
                      content=next(minN,maxN).toString();
                    }else{
                      content='Please check the numbers.';
                    }
                  }else{
                    content='There\'s an empty field.';
                  }
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text(
                            content,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold
                            ),
                          )
                          ,
                        );
                      }
                      );
                },
                child: Text(
                  'Generate',
                  style: TextStyle(color: Colors.white),
                )
            ),
            Text(
              '',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

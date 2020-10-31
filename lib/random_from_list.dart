import 'package:flutter/material.dart';
import 'dart:math';

class RandomFromList extends StatefulWidget {
  @override
  _RandomFromListState createState() => _RandomFromListState();
}
TabController tabController;
class _RandomFromListState extends State<RandomFromList> {

  List<String> listItems = [];
  final TextEditingController textBoxController = new TextEditingController();
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
    FocusNode focus = FocusNode();
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'Random from list',
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          new TextField(
            focusNode: focus,
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 15.0,
                fontWeight: FontWeight.bold
            ),

            controller: textBoxController,
            onSubmitted: (text) {
              if(text!=""){
                FocusScope.of(context).requestFocus(focus);
                listItems.add(text);
                textBoxController.clear();
                setState(() {});
              }
              else{
                focus=FocusScope.of(context);
              }
            },
          ),
          new Expanded(
              child: new ListView.builder
                (
                  itemCount: listItems.length,
                  itemBuilder: (BuildContext ctxt, int Index) {
                    return new
                    Text(
                      listItems[Index],
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    )
                    ;
                  }
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue[200],
                onPressed: (){
                  var content;
                  if(listItems.length>1){
                    FocusScope.of(context).requestFocus(focus);
                    content = listItems[random.nextInt(listItems.length)];
                  }else{
                    content='Need to add more items to the list.';
                    FocusScope.of(context).requestFocus(focus);
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
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold
                            ),
                          )
                          ,
                        );
                      }
                  );
                },
                child: Text(
                  'Pick a random one',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.yellow[200],
                onPressed: (){
                  listItems.clear();
                  setState(() {

                  });
                },
                child: Text(
                  'Clear list',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
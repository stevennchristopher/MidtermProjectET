import 'package:flutter/material.dart';

class Game extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Screen'),
      ),
      body: Center(child: Text("This is Game "),
      ),
    );
  }
}
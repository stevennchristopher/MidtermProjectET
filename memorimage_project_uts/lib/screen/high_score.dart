import 'package:flutter/material.dart';
import 'package:memorimage_project_uts/main.dart';

class HighScore extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('High Score'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "LEADERBOARD",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text("1st. " + userLBList[0] + " - " + scoreLBList[0].toString()),
        Text("2nd. " + userLBList[1] + " - " + scoreLBList[1].toString()),
        Text("3rd. " + userLBList[2] + " - " + scoreLBList[2].toString()),
      ])),
    );
  }
}

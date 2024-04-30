import 'package:flutter/material.dart';
import 'package:memorimage_project_uts/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Hasil extends StatelessWidget {
  final int _point;
  final String _gelar;

  Hasil(this._point) : _gelar = getGelar(_point);

  static String getGelar(int point) {
    if (point == 0) {
      return "Sfortunato Indovinatore";
    } else if (point == 1) {
      return "Neofita dell'Indovinello";
    } else if (point == 2) {
      return "Principiante dell'Indovinello";
    } else if (point == 3) {
      return "Abile Indovinatore";
    } else if (point == 4) {
      return "Esperto dell'Indovinello";
    } else if (point == 5) {
      return "Maestro dell'Indovinello";
    } else {
      return "";
    }
  }

  void setScore(int point) async {
    final prefs = await SharedPreferences.getInstance();
    if (point > scoreLBList[0]) {
      if (active_user == userLBList[0]) {
        prefs.setInt("topScore1", point);
      } else {
        prefs.setString("topUsername2", userLBList[0]);
        prefs.setInt("topScore2", scoreLBList[0]);

        prefs.setString("topUsername3", userLBList[1]);
        prefs.setInt("topScore3", scoreLBList[1]);

        prefs.setString("topUsername1", active_user);
        prefs.setInt("topScore1", point);
      }
    } else if (point > scoreLBList[1]) {
      if (active_user == userLBList[1]) {
        prefs.setInt("topScore2", point);
      } else {
        prefs.setString("topUsername3", userLBList[1]);
        prefs.setInt("topScore3", scoreLBList[1]);

        prefs.setString("topUsername2", active_user);
        prefs.setInt("topScore2", point);
      }
    } else if (point > scoreLBList[2]) {
      prefs.setString("topUsername3", active_user);
      prefs.setInt("topScore3", point);
    }
  }

  @override
  Widget build(BuildContext context) {
    setScore(_point);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil'),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$_point dari 5 tebakan berhasil dijawab",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Gelar yang didapat: $_gelar",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(height: 10, color: Colors.transparent),
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, 'game');
              },
              child: Text('Play Again'),
            ),
            Divider(height: 10, color: Colors.transparent),
            ElevatedButton(
              onPressed: () {
                getUsername().then((List result) {
                  userLBList = result;
                });

                getScore().then((List result) {
                  scoreLBList = result;
                });

                Navigator.popAndPushNamed(context, 'high_score');
              },
              child: Text('High Score'),
            ),
            Divider(height: 10, color: Colors.transparent),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => (MyApp())),
                );
              },
              child: Text('Main Menu'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:memorimage_project_uts/main.dart';
import 'package:memorimage_project_uts/screen/game.dart';
import 'package:memorimage_project_uts/screen/high_score.dart';
import 'package:memorimage_project_uts/screen/home.dart';
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
    }
    return "";
  }

//   Future<List<String>> checkTopScore() async {
//   final prefs = await SharedPreferences.getInstance();
//   String user_id = prefs.getString("user_id") ?? '';
//   return user_id;
// }

Future<void> saveTopScores(Map<String, int> topScores) async {
  final prefs = await SharedPreferences.getInstance();
  String data = topScores.entries.map((entry) => "${entry.key}:${entry.value}").join(';');
  prefs.setString("top_scores", data);
}

  @override
  Widget build(BuildContext context) {
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
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Gelar yang didapat: $_gelar",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(height: 10, color: Colors.transparent),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => (Game())),
                );
              },
              child: Text('Play Again'),
            ),
            Divider(height: 10, color: Colors.transparent),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => (HighScore())),
                );
              },
              child: Text('High Score'),
            ),
            Divider(height: 10, color: Colors.transparent),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
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

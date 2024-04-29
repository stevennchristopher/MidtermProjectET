import 'package:flutter/material.dart';
import 'package:memorimage_project_uts/main.dart';
import 'package:memorimage_project_uts/screen/home.dart';

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
            Text("$_point dari 5 tebakan berhasil dijawab"),
            Text("Gelar yang didapat: $_gelar"),
            Text(""),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (MyApp())),
                  );
                },
                child: Text('Back to Home'),
              ),
          ],
        ),
      ),
    );
  }
}

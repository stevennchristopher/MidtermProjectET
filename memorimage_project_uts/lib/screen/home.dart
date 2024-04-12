import 'package:flutter/material.dart';
import 'package:memorimage_project_uts/screen/game.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Tata Cara Bermain:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              SizedBox(height: 10),
              Text("1. Pada awal permainan, kamu akan melihat beberapa kartu dengan gambar yang berbeda."),
              Text("2. Setiap kartu hanya akan diperlihatkan selama tiga detik."),
              Text("3. Perhatikan gambar pada setiap kartu yang muncul dan ingatlah pola gambar tersebut."),
              Text("4. Setelah semua kartu diperlihatkan, kemudian akan muncul empat kartu yang dapat kamu pilih."),
              Text("5. Kamu harus menebak dan memilih satu kartu dengan gambar yang benar dari antara keempat kartu tersebut"),
              Text("6. Kamu akan diberi waktu 30 detik untuk memilih kartu pada setiap pertanyaan"),
              Text("7. Satu pertanyaan benar akan bernilai satu poin."),
              Text("8. Selamat bermain!"),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Game()),
                  );
                },
                child: Text('Play Now'),
              ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(child: Column(children: [Text("Tata Cara Bermain:"),
                                            Text("1. Pada awal permainan, kamu akan melihat beberapa kartu dengan gambar yang berbeda."),
                                            Text("2. Setiap kartu hanya akan diperlihatkan selama tiga detik."),
                                            Text("3. Perhatikan gambar pada setiap kartu yang muncul dan ingatlah pola gambar tersebut."),
                                            Text("4. Setelah semua kartu diperlihatkan, kemudian akan muncul empat kartu yang dapat kamu pilih."),
                                            Text("5. Kamu harus menebak dan memilih satu kartu dengan gambar yang benar dari antara keempat kartu tersebut"),
                                            Text("6. Kamu akan diberi waktu 30 detik untuk memilih kartu pada setiap pertanyaan"),
                                            Text("7. Satu pertanyaan benar akan bernilai satu poin."),
                                            Text("8. Selamat bermain!")
      ])),
    );
  }
}
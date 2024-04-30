import 'package:flutter/material.dart';
import 'package:memorimage_project_uts/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:memorimage_project_uts/screen/home.dart';
import 'package:memorimage_project_uts/screen/game.dart';
import 'package:memorimage_project_uts/screen/high_score.dart';

String active_user = "";

List userLBList = [];
List scoreLBList = [];

void doLogout() async {
  final prefs = await SharedPreferences.getInstance();
  active_user = "";
  prefs.remove("user_id");
  main();
}

Future<String> checkUser() async {
  final prefs = await SharedPreferences.getInstance();
  String user_id = prefs.getString("user_id") ?? '';
  return user_id;
}

// void createLB() async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.setString("topUsername1", "");
//   prefs.setInt("topScore1", 0);

//   prefs.setString("topUsername2", "");
//   prefs.setInt("topScore2", 0);

//   prefs.setString("topUsername3", "");
//   prefs.setInt("topScore3", 0);

//   // main();
// }

Future<List> getUsername() async {
  final prefs = await SharedPreferences.getInstance();
  String user1 = prefs.getString("topUsername1") ?? '';
  String user2 = prefs.getString("topUsername2") ?? '';
  String user3 = prefs.getString("topUsername3") ?? '';
  List<String> userLeadboard = [user1, user2, user3];
  return userLeadboard;
}

Future<List> getScore() async {
  final prefs = await SharedPreferences.getInstance();
  int score1 = prefs.getInt("topScore1") ?? 0;
  int score2 = prefs.getInt("topScore2") ?? 0;
  int score3 = prefs.getInt("topScore3") ?? 0;
  List<int> scoreLeadboard = [score1, score2, score3];
  return scoreLeadboard;
}

void main() {
  runApp(const MyApp());
  checkUser().then((String result) {
    if (result == '')
      runApp(MyLogin());
    else {
      active_user = result;
      runApp(MyApp());
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        'home': (context) => Home(),
        'game': (context) => Game(),
        'high_score': (context) => HighScore(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [Home()];
  final List<String> _title = ['Home'];

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_title[_currentIndex]),
      ),
      body: _screens[_currentIndex],
      drawer: myDrawer(),
    );
  }

  Drawer myDrawer() {
    return Drawer(
      elevation: 16.0,
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text(active_user),
              accountEmail: Text(active_user + "@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://i.pravatar.cc/150"))),
          ListTile(
              title: new Text("High Score"),
              leading: new Icon(Icons.score),
              onTap: () {
                getUsername().then((List result) {
                  userLBList = result;
                });

                getScore().then((List result) {
                  scoreLBList = result;
                });

                Navigator.popAndPushNamed(context, 'high_score');
              }),
          ListTile(
              title: new Text(active_user != "" ? "Logout" : "Login"),
              leading: new Icon(Icons.login),
              onTap: () {
                active_user != ""
                    ? doLogout()
                    : Navigator.popAndPushNamed(context, 'login');
              })
        ],
      ),
    );
  }
}

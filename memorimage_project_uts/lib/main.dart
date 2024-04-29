import 'package:flutter/material.dart';
import 'package:memorimage_project_uts/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:memorimage_project_uts/screen/home.dart';
import 'package:memorimage_project_uts/screen/game.dart';
import 'package:memorimage_project_uts/screen/high_score.dart';

String active_user = "";

void doLogout() async {
  //later, we use web service here to check the user id and password
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

  // This widget is the root of your application.
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [Home()];
  final List<String> _title = ['Home'];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_title[_currentIndex]),
      ),
      body: _screens[_currentIndex],
      // bottomNavigationBar: MyBNB(),
      drawer: myDrawer(),
    );
  }

  // BottomNavigationBar MyBNB() {
  //   return BottomNavigationBar(
  //       currentIndex: _currentIndex,
  //       onTap: (int index) {
  //         setState(() {
  //           _currentIndex = index;
  //         });
  //       },
  //       fixedColor: const Color.fromARGB(255, 0, 125, 150),
  //       items: [
  //         BottomNavigationBarItem(
  //           label: "Home",
  //           icon: Icon(Icons.home),
  //         ),
  //         BottomNavigationBarItem(
  //           label: "Game",
  //           icon: Icon(Icons.gamepad),
  //         ),
  //         BottomNavigationBarItem(
  //           label: "High Score",
  //           icon: Icon(Icons.score),
  //         ),
  //       ]);
  // }

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

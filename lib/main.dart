import 'package:flutter/material.dart';
import 'package:pref_demo/second_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  late SharedPreferences prefs;

  _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', 10);
    await prefs.setString('str', '${prefs.getInt('counter')} Hello');
    print(prefs.getString('str'));
    await prefs.setBool('isLogin', true);
    await prefs.setStringList('list', ['hello', 'hi']);
    await prefs.remove('counter');
    print('${prefs.getInt('counter')}');

  }

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SecondScreen()));
              },
              child: const Text(
                'Next Screen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

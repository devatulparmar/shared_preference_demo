
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late SharedPreferences prefs;

  Future<int?> _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getInt('counter');
  }

  @override
  void initState() {
    super.initState();
    _initSharedPreferences().then((value) {
      print(value);
    },);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

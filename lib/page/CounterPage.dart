import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  SharedPreferences? prefs;

  @override
  void initState() {
    init();
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    //기기에서 count 데이터를 갖고와라.
    int counter = 0;
    if (prefs != null) {
      counter = prefs!.getInt('counter') ?? 0;
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          if (prefs != null) {
            //기기에 count에 데이터를 갖고온다.
            int counter = prefs!.getInt('counter') ?? 0;

            //count에다가 더하기를 한다.
            counter++;

            //기기에 count에 데이터를 저장한다.
            prefs!.setInt('counter', counter);

            //build를 다시불러서 화면을 갱신해라.
            setState(() {});
          }
        },
      ),
      body: Text(counter.toString()),
    );
  }
}

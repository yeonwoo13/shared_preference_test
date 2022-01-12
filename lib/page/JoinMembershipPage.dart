import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginPage.dart';

class JoinMembershipPage extends StatefulWidget {
  static late SharedPreferences prefs;

  @override
  _JoinMembershipPageState createState() => _JoinMembershipPageState();
}

class _JoinMembershipPageState extends State<JoinMembershipPage> {
  String id = '';
  String pw = '';
  final myId = TextEditingController();
  final myPassword = TextEditingController();

  bool finishLoaded = false;
  @override
  void initState() {
    super.initState();
    Future future = init();
    future.then((value){
      finishLoaded = true;
    });
  }

  Future<void> init() async {
    // await Future.delayed(Duration(seconds: 3));
    JoinMembershipPage.prefs = await SharedPreferences.getInstance();
    setState(() {
      id = (JoinMembershipPage.prefs.getString('id') ?? '');
      pw = (JoinMembershipPage.prefs.getString('pw') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return !finishLoaded ? CircularProgressIndicator() : loadedWidget();
  }

  Widget widgetSize(Widget widget) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(height: 40, width: 400, child: widget),
    );
  }

  Widget loadedWidget() {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widgetSize(
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: '아이디'),
                  controller: myId,
                ),
              ),
              widgetSize(
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: '비밀번호'),
                  controller: myPassword,
                ),
              ),
              widgetSize(
                ElevatedButton(
                  onPressed: () {
                    id = myId.text;
                    pw = myPassword.text;
                    JoinMembershipPage.prefs.setString('id', id);
                    JoinMembershipPage.prefs.setString('pw', pw);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  child: Text('회원가입하기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preference_test/page/JoinMembershipPage.dart';

class LoginPage extends StatefulWidget {
  static String? id = JoinMembershipPage.prefs.getString('id');
  static String? pw = JoinMembershipPage.prefs.getString('pw');

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final myId = TextEditingController();
  final myPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
                    if (myId.text == LoginPage.id && myPassword.text == LoginPage.pw) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              '로그인되었습니다.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          );
                        },
                      );
                    }
                    else{
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              '로그인에 실패하였습니다.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: Text('로그인'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetSize(Widget widget) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(height: 40, width: 400, child: widget),
    );
  }
}

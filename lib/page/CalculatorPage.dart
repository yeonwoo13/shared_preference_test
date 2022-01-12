import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  // 캐싱을 위한 선언
  String _id = '';
  String _pw = '';
  late SharedPreferences _prefs;


  // 텍스트를 받아오기 위한 선언
  final idController = TextEditingController();
  final pwController = TextEditingController();

  // 위젯이 생성될 때 처음으로 호출되고, 단 한번만 호출된다.
  @override
  void initState() {
    super.initState();  // initState()를 사용할 때 반드시 사용해야 한다.
    _loadId();  // 이 함수를 실행한다.
  }

// 캐시에 있는 데이터를 불러오는 함수
  // 이 함수의 기능으로, 어플을 끄고 켜도 데이터가 유지된다.
  _loadId() async {
    _prefs = await SharedPreferences.getInstance(); // 캐시에 저장되어있는 값을 불러온다.
    setState(() { // 캐시에 저장된 값을 반영하여 현재 상태를 설정한다.
      // SharedPreferences에 id, pw로 저장된 값을 읽어 필드에 저장. 없을 경우 0으로 대입
      _id = (_prefs.getString('id') ?? '');
      _pw = (_prefs.getString('pw') ?? '');
      print(_id); // Run 기록으로 id와 pw의 값을 확인할 수 있음.
      print(_pw);
    });
  }

  //위젯 시작

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('아이디 비밀번호 캐시 테스트')
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(16, 30, 16, 0),
            child: TextField(

              controller: idController, // 여기서 입력받은 String값을 idController에 전달
              decoration: new InputDecoration(

                border: OutlineInputBorder(),
                hintText: "Write your account",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: TextField(

              controller: pwController, // 여기서 입력받은 String값을 pwController에 전달
              decoration: new InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Write your password",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 20, 40, 40),
            child: FloatingActionButton(
                child: Icon(Icons.account_box),
                onPressed: () {
                  _id = idController.text;  // _id 에 입력받은 값 넣어줌
                  _pw = pwController.text;  // _pw 에 입력받은 값 넣어줌
                  _prefs.setString('id', _id);  // id를 키로 가지고 있는 값에 입력받은 _id를 넣어줌. = 캐시에 넣어줌
                  _prefs.setString('pw', _pw);  // pw를 키로 가지고 있는 값에 입력받은 _pw를 넣어줌. = 캐시에 넣어줌

                  showDialog(  // 버튼을 눌렀음을 확인시키기 위한 창 띄우기
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            content: Text(
                              '저장이 완료됐습니다.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            )
                        );
                      }
                  );
                }
            ),
          ),
          Text(
            '아이디: $_id',
            style: TextStyle(
                fontWeight: FontWeight.w700
            ),
          ), // 어플을 재시작해도 데이터가 보존되는지 확인하기 위한 Text창
          Text(
            '비밀번호: $_pw',
            style: TextStyle(
                fontWeight: FontWeight.w700
            ),
          ),
        ],
      ),
    );
  }
}



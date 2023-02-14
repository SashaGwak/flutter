import 'package:flutter/material.dart';

void main() {
  runApp(App());
}
// 앱을 처음 실행할때 보이는 게 App이니까 app은 우리 앱의 root
// root App으로 기본 설정 해줘야함
// Material은 구글, Cupertino는 ios(디자인 선택)

class App extends StatelessWidget {
  // widget을 만들기위해서는 flutter SDK에 있는 3개의 core widget중에 하나를 extend받아야함
  // 모든 widget은 build 메서드(return하는 걸 UI에 보여줌)를 구현해줘야함
  // StatelessWidget는 화면에 띄워주는 애
  // Scaffold는 화면의 구성 및 구조에 관한것들을 가지고 있음(Top bar, body 등...)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello flutter!'),
        ),
        body: Center(
          child: Text('Hello world!'),
        ),
      ),
    );
  }
}

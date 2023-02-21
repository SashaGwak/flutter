import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTile() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // app 스타일 시트 지정
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                onPressed: toggleTile,
                icon: const Icon(
                  Icons.remove_red_eye,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 부모요소인 _AppState에서 theme 을 받아올건데, 이렇게 부모 요소에 접근하는 경우 context사용
// BuildContext context는 자식 이전의 있는 모든 상위 요소들에 대한 정보를 가지고 있음
class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0;

  @override
  // initState는 상태를 초기화하기위한 메서드
  // 자주 사용되는 건 아니지만 종종 부모요소에 의존하는 데이터를 초기화해야하는 경우 쓰임
  // initState는 항상 build보다 먼저 호출되어야함
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  // dispose는 위젯이 스크린에서 제거될 때 호출되는 메서드
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        // 위젯 트리로부터 theme을 가져오게함
        // !은 확실히 있는 경우, ?은 있는 경우 가져오도록 함
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}

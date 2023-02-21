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
            children: const [
              MyLargeTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

// 부모요소인 _AppState에서 theme 을 받아올건데, 이렇게 부모 요소에 접근하는 경우 context사용
// BuildContext context는 자식 이전의 있는 모든 상위 요소들에 대한 정보를 가지고 있음
class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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

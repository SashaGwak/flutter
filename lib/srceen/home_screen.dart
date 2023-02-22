import 'package:flutter/material.dart';
import 'package:toonflix/model/webtoon_model.dart';
import 'package:toonflix/service/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          title: const Text(
            "오늘의 웹툰",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        // FutrueBuilder를 통해서 API를 await해줄수 있음!!!!!WOW
        body: FutureBuilder(
          future: webtoons,
          // snapshot은 Future의 상태(로딩, 데이터있는지, 에러 우뮤 등..)
          builder: (context, snapshot) {
            // future가 완료되어 데이터가 존재하는 지 확인
            if (snapshot.hasData) {
              return const Text('There is data!');
            }
            return const Text('Loading...');
          },
        ));
  }
}

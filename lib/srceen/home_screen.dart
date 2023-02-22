import 'package:flutter/material.dart';
import 'package:toonflix/model/webtoon_model.dart';
import 'package:toonflix/service/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          title: const Text(
            "샤툰",
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
              return MakeList(snapshot);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  ListView MakeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      // user가 보여주는 화면의 데이터만 데꼬옴! WOW
      scrollDirection: Axis.horizontal, // 가로방향
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Text(webtoon.title);
      },
      // ListView.separated 쓰면 separatorBuilder(공백만들어주기) 사용가능
      separatorBuilder: (context, index) => const SizedBox(width: 20),
    );

    // 많은 양의 데이터를 연속적으로 보여주려면 ListView쓰는게 좋음
    // 그래도 ListView를 써서 한번에 모든 데이터를 가져오는 것은 효율적이지 않음 -> ListView.builder사용(보이는 데이터만 불러오기)
    // return ListView(
    //   children: [
    //     for (var webtoon in snapshot.data!) Text(webtoon.title)
    //   ],
    // );
  }
}

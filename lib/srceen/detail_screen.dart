import 'package:flutter/material.dart';
import 'package:toonflix/model/webtoon_detail.dart';
import 'package:toonflix/model/webtoon_episode_model.dart';
import 'package:toonflix/service/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  // stateless일 때 여기서 api 불러오면 data를 초기화만시킨 상태기 때문에 아래와 같이 사용할 수 없음
  // final Future<List<WebtoonDetailsModel> webtoon = ApiService.getToonById(id);

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

//  StatefulWidget으로 바꿔줌으로서 별개의 class로 바뀌어 data를 widget.id이렇게 불러옴
// 여기서 의마하는 widget이 DetailScreen(부모>를 의미하게 되는 것 !
class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailsModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  // initState는 항상 build보다 먼저 호출
  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // hero : 화면이동시 시각적 연결고리를 만들어줌(애니메이션으로 화면내에서 이동)
                  // -> 따라서 연결할 페이지들에 hero 위젯을 달아줘야함
                  // hero 위젯은 고유값으로 tag를 달아줘야함
                  Hero(
                    tag: widget.id,
                    child: Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                offset: const Offset(10, 10),
                                color: Colors.black.withOpacity(0.5)),
                          ]),
                      child: Image.network(widget.thumb),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Text('...');
                },
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // Episode는 10개의 리스트로 List쓰기에는 짧아서 column 써줌
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.green.shade400,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      episode.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.white,
                                    ),
                                  ]),
                            ),
                          )
                      ],
                    );
                  }
                  throw Error();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

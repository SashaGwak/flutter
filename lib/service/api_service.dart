import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toonflix/model/webtoon_detail.dart';
import 'package:toonflix/model/webtoon_episode_model.dart';
import 'package:toonflix/model/webtoon_model.dart';

class ApiService {
  static const baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  static const today = 'today';
  // 비동기 함수로 지정하면 함수의 반환타입은 future로 지정해줘야함
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    // get type은 Future<Response>로 Future는 미래 받을 값을 지정해줌
    // api 요청이 처리되어 응답을 반환할때까지 기다려줌(async await 같이 써줌)
    if (response.statusCode == 200) {
      // body string으로 넘어와서 json으로 변환
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailsModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailsModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        final instance = WebtoonEpisodeModel.fromJson(episode);
        episodesInstances.add(instance);
      }
      return episodesInstances;
    }
    throw Error();
  }
}

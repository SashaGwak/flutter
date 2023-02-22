class WebtoonModel {
  final String title, thumb, id;

  // name constructor 생성하여 WebtoonModel의 title을 json의 title로 초기화
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}

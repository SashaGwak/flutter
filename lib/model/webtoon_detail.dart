class WebtoonDetailsModel {
  final String title, about, genre, age;

  WebtoonDetailsModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'];
}

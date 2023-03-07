class MovieModel {
  int? id;

  String? posterPath;

  String? title;

  String? backdropPath;

  MovieModel({this.id, this.posterPath, this.title, this.backdropPath});

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    posterPath = json['poster_path'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
  }
}

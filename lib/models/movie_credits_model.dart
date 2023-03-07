class MovieCreditsModel {
  int? id;
  String? name;
  String? profilePath;
  int? castId;
  String? creditId;

  MovieCreditsModel({
    this.id,
    this.name,
    this.profilePath,
    this.castId,
    this.creditId,
  });

  MovieCreditsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    name = json['name'];

    profilePath = json['profile_path'];
    castId = json['cast_id'];

    creditId = json['credit_id'];
  }
}

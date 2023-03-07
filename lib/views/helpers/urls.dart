class Urls {
  static const String apiKey = 'api_key=f6b0b868e75dbed8c0907797342365dc';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imagesUrl = 'https://image.tmdb.org/t/p/original';
  static const String langUrl = '&language=en-US&page=1';

  /// Image
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';
  static String movieImages(int id) =>
      '$baseUrl/movie/$id/images?$apiKey&language=en-US&include_image_language=en,null';
  static String tvImages(int id) =>
      '$baseUrl/tv/$id/images?$apiKey&language=en-US&include_image_language=en,null';

  /// Youtube trailer
  static String movieTrailer(int id) => '$baseUrl/movie/$id/videos?$apiKey';
  static String tvShowTrailer(int id) => '$baseUrl/tv/$id/videos?$apiKey';

  /// Movies
  static const String upCommingMovies = '$baseUrl/movie/upcoming?$apiKey';
  static const String trendingMovies = '$baseUrl/trending/movie/day?$apiKey';
  static const String nowPlayingMovies = '$baseUrl/movie/now_playing?$apiKey';
  static const String popularMovies = '$baseUrl/movie/popular?$apiKey';
  static const String topRatedMovies = '$baseUrl/movie/top_rated?$apiKey';
  static String movieDetail(int id) => '$baseUrl/movie/$id?$apiKey';
  static String movieRecommendations(int id) =>
      '$baseUrl/movie/$id/recommendations?$apiKey';
  static String movieSimilar(int id) =>
      '$baseUrl/movie/$id/similar?$apiKey';
  static String movieCredits(int id) => '$baseUrl/movie/$id/credits?$apiKey';
  static String searchMovies(String query) =>
      '$baseUrl/search/movie?$apiKey&query=$query';

  /// Casts
  static const String popularCast = '$baseUrl/person/popular?$apiKey';
  static String castDetail(int id) => '$baseUrl/person/$id?$apiKey';
  static String castMovieCredits(int id) =>
      '$baseUrl/person/$id/movie_credits?$apiKey';

  /// TVs
  static const String onTheAirTvs = '$baseUrl/tv/on_the_air?$apiKey';
  static const String popularTvs = '$baseUrl/tv/popular?$apiKey';
  static const String topRatedTvs = '$baseUrl/tv/top_rated?$apiKey';
  static String tvShowCredits(int id) => '$baseUrl/tv/$id/credits?$apiKey';
  static String tvDetail(int id) => '$baseUrl/tv/$id?$apiKey';
  static String tvSeasons(int id, int seasonNumber) =>
      '$baseUrl/tv/$id/season/$seasonNumber?$apiKey';
  static String tvRecommendations(int id) =>
      '$baseUrl/tv/$id/recommendations?$apiKey';
  static String searchTvs(String query) =>
      '$baseUrl/search/tv?$apiKey&query=$query';
}

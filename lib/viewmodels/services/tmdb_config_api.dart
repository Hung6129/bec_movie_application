import 'package:bec_movie_application/models/movie_credits_model.dart';
import 'package:bec_movie_application/models/movie_detail_model.dart';
import 'package:bec_movie_application/models/movie_model.dart';
import 'package:bec_movie_application/views/helpers/urls.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final servicesProvider = Provider<Services>((ref) {
  return Services();
});

class Services {
  final Dio _dio = Dio();

  /// Get Trending Movie
  Future<List<MovieModel>> getTrendingMovie() async {
    try {
      Response response = await _dio.get(Urls.trendingMovies);
      if (response.statusCode == 200) {
        final data = response.data['results'] as List<dynamic>;

        return data.map((json) => MovieModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load popular movies');
      }
    } catch (e, stack) {
      throw Exception('Failed to load popular movies $e $stack');
    }
  }

  /// Get recommended movie by movie id
  Future<List<MovieModel>> getRecommendationMovie(int movieId) async {
    try {
      Response response = await _dio.get(Urls.movieRecommendations(movieId));
      if (response.statusCode == 200) {
        final data = response.data['results'] as List<dynamic>;

        return data.map((json) => MovieModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load popular movies');
      }
    } catch (e, stack) {
      throw Exception('Failed to load popular movies $e $stack');
    }
  }

  /// Get nowplaying movie
  Future<List<MovieModel>> getNowPalyingMovie() async {
    try {
      Response response = await _dio.get(Urls.nowPlayingMovies);
      if (response.statusCode == 200) {
        final data = response.data['results'] as List<dynamic>;

        return data.map((json) => MovieModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load popular movies');
      }
    } catch (e, stack) {
      throw Exception('Failed to load popular movies $e $stack');
    }
  }

  /// Get top rated movie
  Future<List<MovieModel>> getTopRatedMovie() async {
    try {
      Response response = await _dio.get(Urls.topRatedMovies);
      if (response.statusCode == 200) {
        final data = response.data['results'] as List<dynamic>;

        return data.map((json) => MovieModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load popular movies');
      }
    } catch (e, stack) {
      throw Exception('Failed to load popular movies $e $stack');
    }
  }

  /// Get movie detail by movie id
  Future<MovieDetailModel> getTopDetailMovie(int movieId) async {
    try {
      Response response = await _dio.get(Urls.movieDetail(movieId));
      if (response.statusCode == 200) {
        final data = response.data;
        return MovieDetailModel.fromJson(data);
      } else {
        throw Exception('Failed to load popular movies');
      }
    } catch (e, stack) {
      throw Exception('Failed to load popular movies $e $stack');
    }
  }

  /// Get movie detail by movie id
  Future<List<MovieCreditsModel>> getCreditsMovie(int movieId) async {
    try {
      Response response = await _dio.get(Urls.movieCredits(movieId));
      if (response.statusCode == 200) {
        final data = response.data['cast'] as List<dynamic>;
        return data.map((json) => MovieCreditsModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load popular movies');
      }
    } catch (e, stack) {
      throw Exception('Failed to load popular movies $e $stack');
    }
  }

  /// Get movie simi by movie id
  Future<List<MovieModel>> getSimilarMovie(int movieId) async {
    try {
      Response response = await _dio.get(Urls.movieSimilar(movieId));
      if (response.statusCode == 200) {
        final data = response.data['results'] as List<dynamic>;
        return data.map((json) => MovieModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load popular movies');
      }
    } catch (e, stack) {
      throw Exception('Failed to load popular movies $e $stack');
    }
  }
}

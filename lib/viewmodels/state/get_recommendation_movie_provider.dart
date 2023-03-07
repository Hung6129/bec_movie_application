import 'package:bec_movie_application/models/movie_model.dart';
import 'package:bec_movie_application/viewmodels/services/tmdb_config_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final recommendationMovieProvider =
    FutureProvider.family<List<MovieModel>, int>(
  (ref, movieId) async {
    final services = ref.watch(servicesProvider);
    return services.getRecommendationMovie(movieId);
  },
);

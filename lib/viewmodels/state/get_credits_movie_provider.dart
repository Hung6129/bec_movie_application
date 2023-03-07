import 'package:bec_movie_application/models/movie_credits_model.dart';
import 'package:bec_movie_application/viewmodels/services/tmdb_config_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final movieCreditsProvider =
    FutureProvider.family<List<MovieCreditsModel>, int>(
  (ref, movieId) async {
    final services = ref.watch(servicesProvider);
    return services.getCreditsMovie(movieId);
  },
);

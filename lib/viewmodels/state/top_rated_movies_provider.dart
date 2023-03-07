import 'package:bec_movie_application/models/movie_model.dart';
import 'package:bec_movie_application/viewmodels/services/tmdb_config_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final topratedMoviesProvider = FutureProvider<List<MovieModel>>((ref) async {
  return ref.watch(servicesProvider).getTopRatedMovie();
});
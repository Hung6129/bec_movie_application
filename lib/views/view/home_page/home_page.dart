import 'package:bec_movie_application/viewmodels/state/nowplaying_movie_provider.dart';
import 'package:bec_movie_application/viewmodels/state/top_rated_movies_provider.dart';
import 'package:bec_movie_application/views/helpers/strings.dart';
import 'package:bec_movie_application/views/widgets/carousell_movie_list_widget.dart';
import 'package:bec_movie_application/views/widgets/horizontal_movie_list_widget.dart';
import 'package:bec_movie_application/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listNowPlaying = ref.watch(nowplayingMovieProvider);
    final listTopRated = ref.watch(topratedMoviesProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget.textTitle(Strings.trending),
            const CarousellMovieListWidget(),
            const SizedBox(height: 20),
            TextWidget.textTitle(Strings.nowPlaying),
            HorizontalMovieListWidget(listNowPlaying),
            const SizedBox(height: 20),
            TextWidget.textTitle(Strings.topRated),
            HorizontalMovieListWidget(listTopRated),
          ],
        ),
      ),
    );
  }
}

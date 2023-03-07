import 'package:bec_movie_application/viewmodels/state/get_credits_movie_provider.dart';
import 'package:bec_movie_application/viewmodels/state/get_detail_movie_provider.dart';
import 'package:bec_movie_application/viewmodels/state/get_recommendation_movie_provider.dart';
import 'package:bec_movie_application/viewmodels/state/get_similar_movie_provider.dart';
import 'package:bec_movie_application/views/helpers/palettes.dart';
import 'package:bec_movie_application/views/helpers/strings.dart';
import 'package:bec_movie_application/views/helpers/text_style.dart';
import 'package:bec_movie_application/views/helpers/urls.dart';
import 'package:bec_movie_application/views/widgets/horizontal_credit_list_widget.dart';
import 'package:bec_movie_application/views/widgets/horizontal_movie_list_widget.dart';
import 'package:bec_movie_application/views/widgets/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class MovieDetailPage extends ConsumerWidget {
  final int movieId;
  const MovieDetailPage(this.movieId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movie = ref.watch(movieDetailsProvider(movieId));
    final recommendationMovie = ref.watch(recommendationMovieProvider(movieId));
    final movieCredits = ref.watch(movieCreditsProvider(movieId));
    final similarMovie = ref.watch(similarMovieProvider(movieId));
    return Scaffold(
        body: movie.when(
      data: (data) => CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.greenAccent,
                  size: 30,
                ),
              ),
            ],
            backgroundColor: Palettes.p3,
            pinned: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: Urls.imagesUrl + data.backdropPath.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  data.title!,
                  textAlign: TextAlign.center,
                  style: TextStyles.defaultStyle.fontHeader.bold,
                ),
                Text(data.tagline!),
                Divider(
                  endIndent: 10,
                  indent: 10,
                  color: Colors.black.withOpacity(0.6),
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Play Trailer')),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(data.overview!,
                      style: TextStyles.defaultStyle.fontOverview),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget.textSubTitle(
                        Strings.releaseDate, data.releaseDate!),
                    TextWidget.textSubTitle(
                        Strings.runtime, '${data.runtime} min'),
                    TextWidget.textSubTitle(
                        Strings.voteAverage, data.voteAverage.toString()),
                    TextWidget.textSubTitle(
                        Strings.voteCount, data.voteCount.toString()),
                    TextWidget.textSubTitle(
                      Strings.budget,
                      NumberFormat.currency(symbol: 'USD ', decimalDigits: 2)
                          .format(data.budget),
                    ),
                    TextWidget.textSubTitle(
                      Strings.revenue,
                      NumberFormat.currency(symbol: 'USD ', decimalDigits: 2)
                          .format(data.revenue),
                    ),
                    Divider(
                      endIndent: 10,
                      indent: 10,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    TextWidget.textTitle(Strings.movieCredits),
                    HorizontalCreditListWidget(movieCredits),
                    const SizedBox(height: 30),
                    TextWidget.textTitle(Strings.recommendations),
                    HorizontalMovieListWidget(recommendationMovie),
                    const SizedBox(height: 30),
                    TextWidget.textTitle(Strings.similar),
                    HorizontalMovieListWidget(similarMovie),
                    const SizedBox(height: 100)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    ));
  }
}

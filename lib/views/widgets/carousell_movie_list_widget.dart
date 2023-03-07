import 'package:bec_movie_application/viewmodels/state/get_trending_movie_provider.dart';
import 'package:bec_movie_application/views/helpers/palettes.dart';
import 'package:bec_movie_application/views/helpers/text_style.dart';
import 'package:bec_movie_application/views/helpers/urls.dart';
import 'package:bec_movie_application/views/view/detail/movie_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CarousellMovieListWidget extends ConsumerWidget {
  const CarousellMovieListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listTrending = ref.watch(trendingMovieProvider);
    return listTrending.when(
      data: (data) {
        return CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: data.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailPage(i.id!),
                      ),
                    );
                  },
                  child: CachedNetworkImage(
                    imageUrl: Urls.imagesUrl + i.backdropPath.toString(),
                    imageBuilder: (context, imageProvider) => Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      margin: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 350,
                        height: 200,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Center(
                            child: Text(
                              i.title!,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyles.defaultStyle.whiteTextColor.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const SizedBox(
                      width: 350,
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        margin: EdgeInsets.only(right: 10),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Card(
                        color: Palettes.p3, child: Icon(Icons.error)),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const SizedBox(
        width: 350,
        height: 200,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          margin: EdgeInsets.only(right: 10),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

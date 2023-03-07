import 'package:bec_movie_application/models/movie_credits_model.dart';
import 'package:bec_movie_application/views/helpers/palettes.dart';
import 'package:bec_movie_application/views/helpers/urls.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HorizontalCreditListWidget extends ConsumerWidget {
  final AsyncValue<List<MovieCreditsModel>> listData;
  const HorizontalCreditListWidget(this.listData, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return listData.when(
      data: (data) {
        return SizedBox(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            itemExtent: 150,
            padding: const EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => MovieDetailPage(data[index].id!),
                  //   ),
                  // );
                },
                child: CachedNetworkImage(
                  imageUrl: Urls.imagesUrl + data[index].profilePath.toString(),
                  imageBuilder: (context, imageProvider) => Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    margin: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const SizedBox(
                    width: 150,
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
                    color: Palettes.p3,
                    child: Icon(Icons.error),
                  ),
                ),
              );
            },
          ),
        );
      },
      loading: () => const SizedBox(
        width: 150,
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
      error: (error, stack) => Center(child: Text(error.toString())),
    );
  }
}

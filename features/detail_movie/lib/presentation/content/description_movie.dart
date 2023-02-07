import 'package:core/core.dart';
import 'package:core/data/models/detail_movie_model.dart';
import 'package:flutter/material.dart';

class DescriptionMovie extends StatelessWidget {
  final DetailMovieModels data;
  const DescriptionMovie({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: marginAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            data.originalTitle,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 25,
            child: ListView.builder(
              itemCount: data.genres.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Text(
                data.genres[index].name +
                    '${(data.genres.length - 1) == index ? '' : ',  '}',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: primaryColor, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Deskripsi',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Text(
            data.overview,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}

import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/presentation/bloc/data_genres_bloc.dart';
import 'package:home/presentation/bloc/popular_movie_bloc.dart';
import 'package:home/presentation/widgets/card_vertical.dart';

class ContentPopular extends StatelessWidget {
  const ContentPopular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PopularMovieBloc>().add(OnDataPopular());
    return Column(
      children: [
        ListTile(
          title: Text(
            'Popular',
            style: Theme.of(context).textTheme.titleLarge!,
          ),
          trailing: TextButton(
            style: TextButton.styleFrom(backgroundColor: backgroundColor),
            onPressed: () {},
            child: Text(
              'See All   >',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: subtitleColor),
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: BlocBuilder<PopularMovieBloc, PopularMovieState>(
            builder: (context, state) {
              if (state is PopularMovieLoading) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    radius: 12,
                    color: primaryColor,
                  ),
                );
              } else if (state is PopularMovieHasData) {
                return ListView.builder(
                  itemCount: state.data.length > 10 ? 5 : state.data.length,
                  padding: marginRight,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CardVertical(
                      date: state.data[index].releaseDate.toString(),
                      sipnosis: state.data[index].overview,
                      thumbnail: state.data[index].posterPath,
                      title: state.data[index].title,
                    );
                  },
                );
              } else if (state is PopularMovieError) {
                return Container(
                  color: primaryColor,
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}

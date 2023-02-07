import 'package:core/core.dart';
import 'package:detail_movie/presentation/bloc/detail_movie_bloc.dart';
import 'package:detail_movie/presentation/content/description_movie.dart';
import 'package:detail_movie/presentation/content/headers_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailMoviePages extends StatelessWidget {
  const DetailMoviePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;

    context.read<DetailMovieBloc>().add(OnEventDetailMovie('$id'));
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocBuilder<DetailMovieBloc, DetailMovieState>(
        builder: (context, state) {
          if (state is DetailMovieLoading) {
            return const Center(
              child: Text('Loading....'),
            );
          } else if (state is DetailMovieHasData) {
            return ListView(
              children: [
                HeadersAppBar(image: state.data.posterPath),
                DescriptionMovie(data: state.data)
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

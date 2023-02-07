import 'package:core/core.dart';
import 'package:core/utils/route_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/presentation/bloc/data_genres_bloc.dart';
import 'package:home/presentation/bloc/filter_genre_bloc.dart';
import 'package:home/presentation/widgets/card_category.dart';
import 'package:home/presentation/widgets/card_vertical.dart';

class ContentCategory extends StatelessWidget {
  const ContentCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<DataGenresBloc>().add(OnGetDataGenres());
    context.read<FilterGenreBloc>().add(OnDefaultGendre());
    return Column(
      children: [
        ListTile(
          title: Text(
            'Category',
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
          height: 38,
          child: BlocBuilder<DataGenresBloc, DataGenresState>(
              builder: (context, state) {
            if (state is DataGenresLoading) {
              return const Center(
                child: CupertinoActivityIndicator(
                  radius: 12,
                  color: primaryColor,
                ),
              );
            } else if (state is DataGenresHasData) {
              return ListView.builder(
                itemCount: state.data.genres.length,
                shrinkWrap: true,
                padding: marginRight,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context
                          .read<FilterGenreBloc>()
                          .add(OnSelectedGendre(state.data.genres[index].id));
                    },
                    child: CardCategory(
                      title: state.data.genres[index].name,
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          }),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 220,
            child: BlocBuilder<FilterGenreBloc, FilterGenreState>(
                builder: (context, state) {
              if (state is FilterGenreLoading) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    radius: 12,
                    color: primaryColor,
                  ),
                );
              } else if (state is FilterGenreHasData) {
                return ListView.builder(
                  itemCount: state.data.length > 10 ? 5 : state.data.length,
                  padding: marginRight,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.detailMovie,
                            arguments: state.data[index].id);
                      },
                      child: CardVertical(
                        date: state.data[index].releaseDate.toString(),
                        sipnosis: state.data[index].overview,
                        thumbnail: state.data[index].posterPath,
                        title: state.data[index].title,
                      ),
                    );
                  },
                );
              } else if (state is FilterGenreError) {
                return const Center(child: Text('Error Data'));
              }
              return const SizedBox();
            })),
      ],
    );
  }
}

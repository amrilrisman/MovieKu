import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/presentation/bloc/data_genres_bloc.dart';
import 'package:home/presentation/widgets/card_category.dart';
import 'package:home/presentation/widgets/card_vertical.dart';

class ContentCategory extends StatelessWidget {
  const ContentCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<DataGenresBloc>().add(OnGetDataGenres());
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
                  return CardCategory(
                    title: state.data.genres[index].name,
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
          child: ListView.builder(
            itemCount: 10,
            padding: marginRight,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const CardVertical();
            },
          ),
        ),
      ],
    );
  }
}

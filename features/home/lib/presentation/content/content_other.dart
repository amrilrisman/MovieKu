import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/widgets/card_horizontal.dart';

class ContentPopularMovie extends StatelessWidget {
  const ContentPopularMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        ListView.builder(
          itemCount: 5,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: marginHorizontal,
          itemBuilder: (context, index) {
            return const CardMovieHorizontal();
          },
        ),
      ],
    );
  }
}

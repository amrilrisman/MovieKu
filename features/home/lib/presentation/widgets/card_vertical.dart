import 'package:core/core.dart';
import 'package:flutter/material.dart';

class CardVertical extends StatelessWidget {
  final String title, sipnosis, date, thumbnail;
  const CardVertical(
      {Key? key,
      required this.title,
      required this.sipnosis,
      required this.date,
      required this.thumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: marginLeft,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(
                      ApiUrl.baseImage + thumbnail,
                    ),
                    // 'https://akcdn.detik.net.id/visual/2020/07/16/kimetsu-no-yaiba_169.jpeg',),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    maxLines: 1, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 4,
                ),
                FittedBox(
                  child: Text(date, style: Theme.of(context).textTheme.caption),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Text(sipnosis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

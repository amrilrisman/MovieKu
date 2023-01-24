import 'package:core/core.dart';
import 'package:flutter/material.dart';

class CardVertical extends StatelessWidget {
  const CardVertical({Key? key}) : super(key: key);

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
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(
                      'https://akcdn.detik.net.id/visual/2020/07/16/kimetsu-no-yaiba_169.jpeg',
                    ),
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
                FittedBox(
                  child: Text('Kimetsu No Yaiba',
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                Text('Action', style: Theme.of(context).textTheme.caption)
              ],
            ),
          ))
        ],
      ),
    );
  }
}

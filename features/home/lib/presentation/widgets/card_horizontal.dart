import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardMovieHorizontal extends StatelessWidget {
  const CardMovieHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              child: Image.network(
                'https://akcdn.detik.net.id/visual/2020/07/16/kimetsu-no-yaiba_169.jpeg',
                fit: BoxFit.fill,
                height: 120,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}

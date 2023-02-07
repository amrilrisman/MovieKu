import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardCategory extends StatelessWidget {
  final String title;
  const CardCategory({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: marginLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(1000)),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .button!
            .copyWith(color: backgroundColor),
      ),
    );
  }
}

import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeadersAppBar extends StatelessWidget {
  final String image;
  const HeadersAppBar({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          ApiUrl.baseImage + image,
          width: double.infinity,
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height * 0.35,
        ),
        ListTile(
          contentPadding: marginAll,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              backgroundColor: primaryColor.withOpacity(0.1),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
            ),
          ),
          trailing: InkWell(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: primaryColor.withOpacity(0.1),
              child: const Icon(
                Icons.share_rounded,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}

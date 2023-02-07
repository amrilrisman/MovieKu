import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContentAppBar extends StatelessWidget {
  const ContentAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.2,
      forceElevated: false,
      snap: false,
      centerTitle: false,
      floating: false,
      pinned: true,
      titleSpacing: 1,
      flexibleSpace: SABT(
        child: ListView(
          padding: marginAll,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              // visualDensity: const VisualDensity(vertical: -3, horizontal: -3),
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: primaryColor.withOpacity(0.2),
              ),
              title: Text(
                'Hello there',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: subtitleColor),
              ),
              subtitle: Text(
                'Amril Rismanto Ichsan',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: titleColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              trailing: CircleAvatar(
                backgroundColor: primaryColor.withOpacity(0.1),
                radius: 20,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.mail,
                    color: primaryColor,
                    size: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: subtitleColor,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      color: subtitleColor,
                      offset: Offset(0, 4),
                      blurRadius: 6,
                    )
                  ]),
              child: TextField(
                decoration: InputDecoration(
                    icon: const Icon(Icons.search, color: primaryColor),
                    suffixIcon: const Icon(
                      Icons.filter_list_rounded,
                      color: primaryColor,
                      size: 18,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    hintText: 'Explore Something Movie',
                    hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: subtitleColor,
                          fontWeight: FontWeight.w400,
                        ),
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController _controllerRmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: const Icon(
          Icons.category,
          color: primaryColor,
          size: 24,
        ),
        title: Text(
          'Login',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        // padding: const EdgeInsets.all(8.0),
        padding: marginAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Login to your account - enjoy execlusive movie and any more',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: titleColor.withOpacity(0.7)),
            ),
            const SizedBox(
              height: 70,
            ),
            FormDefault(
              controller: _controllerRmail,
              titleFields: 'Email',
              hint: 'Masukan email anda',
            ),
            const SizedBox(
              height: 16,
            ),
            FormDefault(
              controller: _controllerPassword,
              titleFields: 'Password',
              hint: '********',
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {
                context.read<AuthUserBloc>().add(
                      OnUserLogin(
                          userEntity: UserLoginEntity(
                              username: 'johnny_appleseed',
                              password: 'test123',
                              requestToken:
                                  '361dcf8341cbf02140ca74bb7fd5d189b138322c'),
                          context: context),
                    );
              },
              child: Text(
                'Login',
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: backgroundColor),
              ),
            ),
            Padding(
              padding: marginVertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(
                    margin: marginRight,
                    height: 2,
                    color: primaryColor.withAlpha(10),
                  )),
                  Text(
                    'OR',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: subtitleColor),
                  ),
                  Expanded(
                      child: Container(
                    margin: marginLeft,
                    height: 2,
                    color: primaryColor.withAlpha(10),
                  )),
                ],
              ),
            ),
            Text(
              'OR',
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: subtitleColor),
            ),
            BlocBuilder<AuthUserBloc, AuthUserState>(builder: (context, state) {
              if (state is AuthUserLoading) {
                return const CupertinoActivityIndicator(
                  radius: 12,
                  color: primaryColor,
                );
              }
              return TextButton(
                onPressed: () {
                  context.read<AuthUserBloc>().add(OnGuestLogin(context));
                },
                style: TextButton.styleFrom(
                    backgroundColor: backgroundColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: primaryColor,
                        ))),
                child: Text(
                  'A guest',
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: primaryColor),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

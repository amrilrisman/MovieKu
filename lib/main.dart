import 'package:auth/presentation/bloc/auth_user_bloc.dart';
import 'package:auth/presentation/pages/login_page.dart';
import 'package:auth/presentation/pages/splash_screen.dart';
import 'package:core/core.dart';
import 'package:detail_movie/presentation/bloc/detail_movie_bloc.dart';
import 'package:detail_movie/presentation/pages/detail_movie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/home.dart';
import 'package:home/presentation/bloc/data_genres_bloc.dart';
import 'package:home/presentation/bloc/filter_genre_bloc.dart';
import 'package:home/presentation/bloc/popular_movie_bloc.dart';
import 'package:movieku_apps/injections.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.injection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthUserBloc>(
            create: (context) => di.locator<AuthUserBloc>()),
        BlocProvider<DataGenresBloc>(
            create: (context) => di.locator<DataGenresBloc>()),
        BlocProvider<PopularMovieBloc>(
            create: (context) => di.locator<PopularMovieBloc>()),
        BlocProvider<FilterGenreBloc>(
            create: (context) => di.locator<FilterGenreBloc>()),
        BlocProvider<DetailMovieBloc>(
            create: (context) => di.locator<DetailMovieBloc>()),
      ],
      child: MaterialApp(
        home: const SplashScreenPage(),
        debugShowCheckedModeBanner: false,
        title: 'Movie Ku',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: primaryColor,
                background: backgroundColor,
                secondary: secondaryColor,
              ),
          scaffoldBackgroundColor: primaryColor,
          textTheme: TextTheme(
            bodyText1: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: titleColor,
                ),
            bodyText2: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: titleColor,
                ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shadowColor: Colors.black,
                surfaceTintColor: backgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
          ),
        ),
        navigatorObservers: [observer],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case RouteName.splashScreen:
              return MaterialPageRoute(
                  builder: (_) => const SplashScreenPage());
            case RouteName.loginPage:
              return MaterialPageRoute(builder: (_) => LoginPage());
            case RouteName.homePage:
              return MaterialPageRoute(builder: (_) => const HomePage());
            case RouteName.detailMovie:
              return MaterialPageRoute(
                  builder: (_) => const DetailMoviePages(), settings: settings);

            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}

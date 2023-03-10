import 'package:auth/auth.dart';
import 'package:auth/domain/use_case/auth_usecase.dart';
import 'package:core/core.dart';
import 'package:detail_movie/domain/usecase/detail_movie_usecase.dart';
import 'package:detail_movie/presentation/bloc/detail_movie_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:home/domain/use_case/genre_usecase.dart';
import 'package:home/domain/use_case/move_popular_usecase.dart';
import 'package:home/presentation/bloc/data_genres_bloc.dart';
import 'package:home/presentation/bloc/filter_genre_bloc.dart';
import 'package:home/presentation/bloc/popular_movie_bloc.dart';

final locator = GetIt.instance;
Future injection() async {
  // bloc
  locator.registerFactory<AuthUserBloc>(() => AuthUserBloc(locator()));
  locator.registerFactory<DataGenresBloc>(() => DataGenresBloc(locator()));
  locator.registerFactory<PopularMovieBloc>(() => PopularMovieBloc(locator()));
  locator.registerFactory<FilterGenreBloc>(
      () => FilterGenreBloc(locator(), locator()));
  locator.registerFactory<DetailMovieBloc>(() => DetailMovieBloc(locator()));

  // service api
  locator.registerFactory<ServiceApi>(() => ServiceApi());

  // repository
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImplementation(locator()));
  locator.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImplementation(locator()));

  // usecase
  locator.registerLazySingleton<AuthUseCase>(() => AuthUseCase(locator()));
  locator.registerLazySingleton<GenreUsecase>(() => GenreUsecase(locator()));
  locator.registerLazySingleton<MoviePopularUseCase>(
      () => MoviePopularUseCase(locator()));
  locator.registerLazySingleton<DetailMovieUseCase>(
      () => DetailMovieUseCase(locator()));

  // data source
  locator.registerLazySingleton<AuthRemoteSource>(
      () => AuthRemoteSourceImplementation(locator()));
  locator.registerLazySingleton<MovieRemoteSource>(
      () => MovieRemoteSourceImplementation(locator()));
}

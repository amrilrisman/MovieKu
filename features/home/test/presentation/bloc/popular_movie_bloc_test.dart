import 'dart:convert';

import 'package:core/data/models/movie_model.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/domain/use_case/move_popular_usecase.dart';
import 'package:home/presentation/bloc/popular_movie_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../data_dumy/read_data_dumy_test.dart';
import '../../helper_test/helper_test.mocks.dart';

void main() {
  late MockMoviePopularUseCase moviePopularUseCase;
  late PopularMovieBloc popular;

  setUp(
    () {
      moviePopularUseCase = MockMoviePopularUseCase();
      popular = PopularMovieBloc(moviePopularUseCase);
    },
  );

  final List response =
      json.decode(readJson('data_dumy/dumy_list_movie.json'))['results'];

  final List<MovieModels> dataDumy =
      response.map((e) => MovieModels.fromJson(e)).toList();

  group(
    'test bloc of popular, succes full and error in flutter ',
    () {
      test(
        'initial bloc popular movie',
        () {
          expect(popular.state, PopularMovieInitial());
        },
      );

      blocTest<PopularMovieBloc, PopularMovieState>(
        'emits [Loading, HasData] when MyEvent is added. [OnPopularMovie] Succesfuly',
        build: () {
          when(moviePopularUseCase.execute())
              .thenAnswer((realInvocation) async => Right(dataDumy));
          return popular;
        },
        act: (bloc) => bloc.add(OnDataPopular()),
        expect: () => <PopularMovieState>[
          PopularMovieLoading(),
          const PopularMovieHasData([]),
        ],
      );

      blocTest<PopularMovieBloc, PopularMovieState>(
        'emits [Loading, Error] when MyEvent is added. [OnPopularMovie] UnSuccesfuly',
        build: () {
          when(moviePopularUseCase.execute()).thenAnswer(
              (realInvocation) async => Left(ServerFailure('Server Error')));
          return popular;
        },
        act: (bloc) => bloc.add(OnDataPopular()),
        expect: () => <PopularMovieState>[
          PopularMovieLoading(),
          const PopularMovieError([]),
        ],
      );
    },
  );
}

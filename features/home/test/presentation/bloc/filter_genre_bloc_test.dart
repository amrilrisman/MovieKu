import 'dart:convert';

import 'package:core/core.dart';
import 'package:core/data/models/gendres_model.dart';
import 'package:core/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:home/presentation/bloc/filter_genre_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../data_dumy/read_data_dumy_test.dart';
import '../../helper_test/helper_test.mocks.dart';

void main() {
  late MockMoviePopularUseCase mockPopularUsecase;
  late MockGenreUsecase mockGenreUseCase;

  late FilterGenreBloc filterBloc;

  setUp(() {
    mockPopularUsecase = MockMoviePopularUseCase();
    mockGenreUseCase = MockGenreUsecase();
    filterBloc = FilterGenreBloc(mockPopularUsecase, mockGenreUseCase);
  });

  final String idDefault = '1';

  final String selectID = '1';

  GendreModels dumyGenre = GendreModels(
    genres: [
      Genre(
        id: 1,
        name: 'action',
      ),
    ],
  );

  final List responseMovies =
      json.decode(readJson('data_dumy/dumy_list_movie.json'))['results'];

  final List<MovieModels> dataDumy =
      responseMovies.map((e) => MovieModels.fromJson(e)).toList();

  group(
    'Test bloc filter genre',
    () {
      test(
        'initial filter genre bloc',
        () {
          expect(filterBloc.state, FilterGenreInitial());
        },
      );

      // blocTest<FilterGenreBloc, FilterGenreState>(
      //   'emits [loading, Has data] when MyEvent is added. return filter default id whent first build data Succesfuly',
      //   build: () {
      //     when(mockGenreUseCase.execute())
      //         .thenAnswer((_) async => Right(dumyGenre));

      //     when(mockPopularUsecase.execute()).thenAnswer((_) async => Right([])
      //         // {
      //         //   // if (condition) {}
      //         // }
      //         );
      //     return filterBloc;
      //   },
      //   act: (bloc) => bloc.add(OnDefaultGendre()),
      //   expect: () => <FilterGenreState>[
      //     FilterGenreLoading(),
      //     const FilterGenreHasData([])
      //   ],
      // );

      // blocTest<FilterGenreBloc, FilterGenreState>(
      //   'emits [loading, Has data] when MyEvent is added. return filter default id whent first build data Succesfuly',
      //   build: () {
      //     when(mockPopularUsecase.execute()).thenAnswer(
      //       (_) async => Right(dataDumy),
      //     );
      //     return filterBloc;
      //   },
      //   act: (bloc) => bloc.add(OnSelectedGendre(int.parse(selectID))),
      //   expect: () => <FilterGenreState>[
      //     FilterGenreLoading(),
      //     FilterGenreHasData(dataDumy)
      //   ],
      // );
      blocTest<FilterGenreBloc, FilterGenreState>(
        'emits [loading, Has data] when MyEvent is added. return filter default id whent first build data Succesfuly',
        build: () {
          when(mockPopularUsecase.execute()).thenAnswer(
            (_) async {
              if (dataDumy.isNotEmpty &&
                  dumyGenre.genres
                      .map((e) => e.id == int.parse(selectID))
                      .toList()
                      .isNotEmpty) {
                Right(dataDumy);
              }
              return Right(dataDumy);
            },
          );
          return filterBloc;
        },
        act: (bloc) => bloc.add(OnSelectedGendre(int.parse(selectID))),
        expect: () => <FilterGenreState>[
          FilterGenreLoading(),
          FilterGenreHasData(dataDumy)
        ],
      );
    },
  );
}

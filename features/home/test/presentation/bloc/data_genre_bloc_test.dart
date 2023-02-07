import 'dart:convert';

import 'package:core/core.dart';
import 'package:core/data/models/gendres_model.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/presentation/bloc/data_genres_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../data_dumy/read_data_dumy_test.dart';
import '../../helper_test/helper_test.mocks.dart';

void main() {
  late MockGenreUsecase genreUseCase;
  late DataGenresBloc genreBloc;

  setUp(
    () {
      genreUseCase = MockGenreUsecase();
      genreBloc = DataGenresBloc(genreUseCase);
    },
  );

  final GendreModels response = GendreModels.fromJson(
      json.decode(readJson('data_dumy/dumy_genre_movie.json')));

  test(
    'test initial genre bloc ',
    () {
      expect(genreBloc.state, DataGenresInitial());
    },
  );

  blocTest<DataGenresBloc, DataGenresState>(
    'emits [Loading, HasData] when MyEvent is added.',
    build: () {
      when(genreUseCase.execute()).thenAnswer((_) async => Right(response));
      return genreBloc;
    },
    act: (bloc) => bloc.add(OnGetDataGenres()),
    expect: () => <DataGenresState>[
      DataGenresLoading(),
      DataGenresHasData(
        response,
      )
    ],
  );

  blocTest<DataGenresBloc, DataGenresState>(
    'emits [MyState] when MyEvent is added.',
    build: () {
      when(genreUseCase.execute())
          .thenAnswer((_) async => const Left(ServerFailure('')));
      return genreBloc;
    },
    act: (bloc) => bloc.add(OnGetDataGenres()),
    expect: () => <DataGenresState>[
      DataGenresLoading(),
      DataGenresError(GendreModels.fromJson({}))
    ],
  );
}

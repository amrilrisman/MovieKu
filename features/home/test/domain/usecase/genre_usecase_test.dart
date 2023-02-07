import 'dart:convert';

import 'package:core/data/models/gendres_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/domain/use_case/genre_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../data_dumy/read_data_dumy_test.dart';
import '../../helper_test/helper_test.mocks.dart';

void main() {
  late MockMovieRepositoryImplementation mockRepoImplementation;

  setUp(() {
    mockRepoImplementation = MockMovieRepositoryImplementation();
  });

  final GendreModels responseGenres = GendreModels.fromJson(
      json.decode(readJson('data_dumy/dumy_genre_movie.json')));

  group(
    'test use case genre',
    () {
      test(
        'get data successfuly',
        () async {
          when(
            mockRepoImplementation.getGendres(),
          ).thenAnswer(
            (realInvocation) => Future.value(Right(responseGenres)),
          );

          GenreUsecase genreUseCase = GenreUsecase(mockRepoImplementation);
          final call = await genreUseCase.execute();

          expect(call, Right(responseGenres));
        },
      );
    },
  );
}

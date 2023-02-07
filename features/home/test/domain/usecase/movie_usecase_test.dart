import 'dart:convert';

import 'package:core/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/domain/use_case/move_popular_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../data_dumy/read_data_dumy_test.dart';
import '../../helper_test/helper_test.mocks.dart';

void main() {
  late MockMovieRepositoryImplementation _mockMovieImpl;

  setUp(
    () {
      _mockMovieImpl = MockMovieRepositoryImplementation();
    },
  );

  final List data =
      json.decode(readJson('data_dumy/dumy_list_movie.json'))['results'];
  List<MovieModels> responseMovie =
      data.map((e) => MovieModels.fromJson(e)).toList();

  test(
    'use case data movie',
    () async {
      print(responseMovie);
      when(_mockMovieImpl.getPopular()).thenAnswer(
        (realInvocation) => Future.value(Right(responseMovie)),
      );

      MoviePopularUseCase _moviePopularUsecase =
          MoviePopularUseCase(_mockMovieImpl);

      final call = await _moviePopularUsecase.execute();
      expect(call, Right(responseMovie));
    },
  );
}

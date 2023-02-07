import 'dart:convert';

import 'package:core/data/models/detail_movie_model.dart';
import 'package:dartz/dartz.dart';
import 'package:detail_movie/domain/usecase/detail_movie_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../data_dumy/read_data_dumy_test.dart';
import '../../helper_test/helper_test.mocks.dart';

void main() {
  late MockMovieRepositoryImplementation _mockMovieRepoImp;
  setUp(
    () {
      _mockMovieRepoImp = MockMovieRepositoryImplementation();
    },
  );

  String idM = '1';

  final DetailMovieModels responseDetail = DetailMovieModels.fromJson(
    json.decode(readJson('data_dumy/dumy_detail_movie.json')),
  );

  test(
    'return usecase detail movie',
    () async {
      when(_mockMovieRepoImp.dataMovieById(idM))
          .thenAnswer((realInvocation) => Future.value(Right(responseDetail)));

      DetailMovieUseCase method = DetailMovieUseCase(_mockMovieRepoImp);
      final call = await method.execute(id: idM);

      expect(call, Right(responseDetail));
    },
  );
}

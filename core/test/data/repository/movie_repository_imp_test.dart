import 'dart:convert';
import 'dart:io';

import 'package:core/core.dart';
import 'package:core/data/models/detail_movie_model.dart';
import 'package:core/data/models/gendres_model.dart';
import 'package:core/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../data_dumy/read_data_dumy.dart';
import '../../helpers_test/helpers_test.mocks.dart';

void main() {
  late MockMovieRemoteSourceImplementation mockMovieRemote;

  setUp(() {
    mockMovieRemote = MockMovieRemoteSourceImplementation();
  });

  final List listMovie =
      json.decode(readJson('data_dumy/dumy_list_movie.json'))['results'];

  final List<MovieModels> responseMovie =
      listMovie.map((e) => MovieModels.fromJson(e)).toList();

  group(
    'test get data of remote movie ',
    () {
      test(' : data list Popular movie successfuly', () async {
        when(
          mockMovieRemote.getPopular(),
        ).thenAnswer(
          (realInvocation) => Future.value(responseMovie),
        );

        MovieRepositoryImplementation movieRepo =
            MovieRepositoryImplementation(mockMovieRemote);

        final call = await movieRepo.getPopular();

        expect(call, Right(responseMovie));
      });

      test(' :  Get data list Popular movie UnsuccessFuly', () async {
        when(
          mockMovieRemote.getPopular(),
        ).thenThrow(
          ServerException(),
        );
        MovieRepositoryImplementation movieRepo =
            MovieRepositoryImplementation(mockMovieRemote);

        final call = await movieRepo.getPopular();
        // verify(mockMovieRemote.getPopular());
        expect(call, const Left(ServerFailure('Server Error')));
      });

      test(
        ' : get data list lost connection ',
        () async {
          when(
            mockMovieRemote.getPopular(),
          ).thenThrow(const SocketException('Lost Connecting'));

          MovieRepositoryImplementation movieRepo =
              MovieRepositoryImplementation(mockMovieRemote);
          final call = await movieRepo.getPopular();

          expect(call, const Left(ConnectingFailure('lostConnecting')));
        },
      );
    },
  );

  final DetailMovieModels detailMovie = DetailMovieModels.fromJson(
      json.decode(readJson('data_dumy/dumy_detail_movie.json')));

  group(
    'test detail movie of API : ',
    () {
      String idM = '1';
      test('get detail movie successfuly', () async {
        when(mockMovieRemote.detailById(id: idM))
            .thenAnswer((realInvocation) => Future.value(detailMovie));

        MovieRepositoryImplementation movieRepo =
            MovieRepositoryImplementation(mockMovieRemote);
        final call = await movieRepo.dataMovieById(idM);
        expect(call, Right(detailMovie));
      });

      test('get detail movie UnSuccessfuly Server Error ', () async {
        when(mockMovieRemote.detailById(id: idM)).thenThrow(ServerException());

        MovieRepositoryImplementation movieRepo =
            MovieRepositoryImplementation(mockMovieRemote);
        final call = await movieRepo.dataMovieById(idM);
        expect(call, const Left(ServerFailure('Server Error')));
      });

      test('get detail movie UnSuccessfuly Lost Connecting ', () async {
        when(mockMovieRemote.detailById(id: idM))
            .thenThrow(const SocketException('lostConnecting'));

        MovieRepositoryImplementation movieRepo =
            MovieRepositoryImplementation(mockMovieRemote);
        final call = await movieRepo.dataMovieById(idM);
        expect(call, const Left(ConnectingFailure('lostConnecting')));
      });
    },
  );

  final GendreModels responseGenres = GendreModels.fromJson(
      json.decode(readJson('data_dumy/dumy_genre_movie.json')));

  group(
    'test get data genre of API',
    () {
      test(
        'successfuly get data genres ',
        () async {
          when(mockMovieRemote.getGendres()).thenAnswer(
            (realInvocation) => Future.value(responseGenres),
          );

          MovieRepositoryImplementation movieRepo =
              MovieRepositoryImplementation(mockMovieRemote);

          final call = await movieRepo.getGendres();
          expect(call, Right(responseGenres));
        },
      );
      test(
        'UnSuccessfully get data genres Excaption Server',
        () async {
          when(mockMovieRemote.getGendres()).thenThrow(ServerException());

          MovieRepositoryImplementation movieRepo =
              MovieRepositoryImplementation(mockMovieRemote);

          final call = await movieRepo.getGendres();
          expect(call, const Left(ServerFailure('server error')));
        },
      );
      test(
        'UnSuccessfully get data genres Lost Connecting ',
        () async {
          when(mockMovieRemote.getGendres())
              .thenThrow(SocketException('Lost Connection'));

          MovieRepositoryImplementation movieRepo =
              MovieRepositoryImplementation(mockMovieRemote);

          final call = await movieRepo.getGendres();
          expect(call, const Left(ConnectingFailure('Lost Connection')));
        },
      );
    },
  );
}

import 'dart:io';

import 'package:core/core.dart';
import 'package:core/data/models/detail_movie_model.dart';
import 'package:core/data/models/gendres_model.dart';
import 'package:core/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImplementation extends MovieRepository {
  final MovieRemoteSource movieRemoteSource;

  MovieRepositoryImplementation(this.movieRemoteSource);

  @override
  Future<Either<Failure, GendreModels>> getGendres() async {
    try {
      final result = await movieRemoteSource.getGendres();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('server error'));
    } on SocketException {
      return const Left(ConnectingFailure('Lost Connection'));
    }
  }

  @override
  Future<Either<Failure, DetailMovie>> dataMovieById(String id) async {
    try {
      final result = await movieRemoteSource.detailById(id: id);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } on SocketException {
      return const Left(ConnectingFailure('lostConnecting'));
    }
  }

  @override
  Future<Either<Failure, MovieModels>> getPopular() async {
    try {
      final result = await movieRemoteSource.getPopular();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } on SocketException {
      return const Left(ConnectingFailure('lostConnecting'));
    }
  }
}

import 'package:core/core.dart';
import 'package:core/data/models/detail_movie_model.dart';
import 'package:core/data/models/gendres_model.dart';
import 'package:core/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, GendreModels>> getGendres();
  Future<Either<Failure, MovieModels>> getPopular();
  Future<Either<Failure, DetailMovie>> dataMovieById(String id);
}

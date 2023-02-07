import 'package:core/core.dart';
import 'package:core/data/models/detail_movie_model.dart';
import 'package:core/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';

class DetailMovieUseCase {
  final MovieRepository movieRemote;

  DetailMovieUseCase(this.movieRemote);

  Future<Either<Failure, DetailMovieModels>> execute(
      {required String id}) async {
    return await movieRemote.dataMovieById(id);
  }
}

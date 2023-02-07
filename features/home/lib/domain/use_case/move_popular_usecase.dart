import 'package:core/core.dart';
import 'package:core/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';

class MoviePopularUseCase {
  final MovieRepository movieRepository;

  MoviePopularUseCase(this.movieRepository);

  Future<Either<Failure, List<MovieModels>>> execute() async {
    return movieRepository.getPopular();
  }
}

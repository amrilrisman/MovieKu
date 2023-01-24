import 'package:core/core.dart';
import 'package:core/data/models/gendres_model.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';

class GenreUsecase {
  final MovieRepository movieRepository;

  GenreUsecase(this.movieRepository);
  Future<Either<Failure, GendreModels>> execute() async {
    return movieRepository.getGendres();
  }
}

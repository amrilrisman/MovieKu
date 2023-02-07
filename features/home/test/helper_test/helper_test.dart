import 'package:core/core.dart';
import 'package:home/domain/use_case/genre_usecase.dart';
import 'package:home/domain/use_case/move_popular_usecase.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  GenreUsecase,
  MoviePopularUseCase,
  MovieRepositoryImplementation,
])
void main() {}

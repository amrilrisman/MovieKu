import 'package:core/core.dart';
import 'package:detail_movie/domain/usecase/detail_movie_usecase.dart';
import 'package:detail_movie/presentation/bloc/detail_movie_bloc.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  DetailMovieUseCase,
  MovieRepositoryImplementation,
  DetailMovieBloc
])
void main() {}

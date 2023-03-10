part of 'popular_movie_bloc.dart';

abstract class PopularMovieState extends Equatable {
  const PopularMovieState();

  @override
  List<Object> get props => [];
}

class PopularMovieInitial extends PopularMovieState {}

class PopularMovieLoading extends PopularMovieState {}

class PopularMovieHasData extends PopularMovieState {
  final List<MovieModels> data;

  const PopularMovieHasData(this.data);
}

class PopularMovieError extends PopularMovieState {
  final List<MovieModels> data;

  const PopularMovieError(this.data);
}

part of 'detail_movie_bloc.dart';

abstract class DetailMovieState extends Equatable {
  const DetailMovieState();

  @override
  List<Object> get props => [];
}

class DetailMovieInitial extends DetailMovieState {}

class DetailMovieLoading extends DetailMovieState {}

class DetailMovieError extends DetailMovieState {
  final String error;

  const DetailMovieError(this.error);
}

class DetailMovieHasData extends DetailMovieState {
  final DetailMovieModels data;

  const DetailMovieHasData(this.data);
}

part of 'data_movie_bloc.dart';

abstract class DataMovieState extends Equatable {
  const DataMovieState();
  
  @override
  List<Object> get props => [];
}

class DataMovieInitial extends DataMovieState {}

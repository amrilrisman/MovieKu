part of 'filter_genre_bloc.dart';

abstract class FilterGenreState extends Equatable {
  const FilterGenreState();

  @override
  List<Object> get props => [];
}

class FilterGenreInitial extends FilterGenreState {}

class FilterGenreLoading extends FilterGenreState {}

class FilterGenreHasData extends FilterGenreState {
  final List<MovieModels> data;

  const FilterGenreHasData(this.data);
}

class FilterGenreEmpty extends FilterGenreState {
  final List<MovieModels> data;

  const FilterGenreEmpty(this.data);
}

class FilterGenreError extends FilterGenreState {}

part of 'filter_genre_bloc.dart';

abstract class FilterGenreEvent extends Equatable {
  const FilterGenreEvent();

  @override
  List<Object> get props => [];
}

class OnSelectedGendre extends FilterGenreEvent {
  final int id;

  const OnSelectedGendre(this.id);
}

class OnDefaultGendre extends FilterGenreEvent {}

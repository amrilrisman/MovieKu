part of 'data_genres_bloc.dart';

abstract class DataGenresEvent extends Equatable {
  const DataGenresEvent();

  @override
  List<Object> get props => [];
}

class OnGetDataGenres extends DataGenresEvent {}

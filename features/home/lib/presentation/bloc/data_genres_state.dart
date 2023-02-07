part of 'data_genres_bloc.dart';

abstract class DataGenresState extends Equatable {
  const DataGenresState();

  @override
  List<Object> get props => [];
}

class DataGenresInitial extends DataGenresState {}

class DataGenresLoading extends DataGenresState {}

class DataGenresError extends DataGenresState {
  final GendreModels data;

  const DataGenresError(this.data);
}

class DataGenresHasData extends DataGenresState {
  final GendreModels data;

  const DataGenresHasData(this.data);
}

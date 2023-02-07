part of 'detail_movie_bloc.dart';

abstract class DetailMovieEvent extends Equatable {
  const DetailMovieEvent();

  @override
  List<Object> get props => [];
}

class OnEventDetailMovie extends DetailMovieEvent {
  final String id;

  const OnEventDetailMovie(this.id);
}

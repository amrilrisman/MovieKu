import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_movie_event.dart';
part 'data_movie_state.dart';

class DataMovieBloc extends Bloc<DataMovieEvent, DataMovieState> {
  DataMovieBloc() : super(DataMovieInitial()) {
    on<DataMovieEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

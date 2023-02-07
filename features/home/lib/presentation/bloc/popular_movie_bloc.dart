import 'package:bloc/bloc.dart';
import 'package:core/data/models/movie_model.dart';
import 'package:equatable/equatable.dart';
import 'package:home/domain/use_case/move_popular_usecase.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final MoviePopularUseCase popularUseCase;
  PopularMovieBloc(this.popularUseCase) : super(PopularMovieInitial()) {
    on<OnDataPopular>(_getDataPopular);
  }

  _getDataPopular(OnDataPopular event, Emitter<PopularMovieState> emit) async {
    emit(PopularMovieLoading());
    final result = await popularUseCase.execute();
    result.fold(
      (failure) => emit(const PopularMovieError([])),
      (data) => emit(PopularMovieHasData(data)),
    );
  }
}

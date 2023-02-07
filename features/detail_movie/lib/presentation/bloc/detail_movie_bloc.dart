import 'package:bloc/bloc.dart';
import 'package:core/data/models/detail_movie_model.dart';
import 'package:detail_movie/domain/usecase/detail_movie_usecase.dart';
import 'package:equatable/equatable.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  final DetailMovieUseCase useCase;
  DetailMovieBloc(this.useCase) : super(DetailMovieInitial()) {
    on<OnEventDetailMovie>(_getDataDetail);
  }

  _getDataDetail(
      OnEventDetailMovie event, Emitter<DetailMovieState> emit) async {
    emit(DetailMovieLoading());
    final result = await useCase.execute(id: event.id);

    result.fold(
      (failure) => emit(const DetailMovieError('Server error')),
      (data) => emit(DetailMovieHasData(data)),
    );
  }
}

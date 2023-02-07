import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core/data/models/movie_model.dart';
import 'package:equatable/equatable.dart';
import 'package:home/domain/use_case/genre_usecase.dart';
import 'package:home/domain/use_case/move_popular_usecase.dart';

part 'filter_genre_event.dart';
part 'filter_genre_state.dart';

class FilterGenreBloc extends Bloc<FilterGenreEvent, FilterGenreState> {
  final MoviePopularUseCase moveUseCase;
  final GenreUsecase genreUseCase;
  FilterGenreBloc(
    this.moveUseCase,
    this.genreUseCase,
  ) : super(FilterGenreInitial()) {
    on<OnSelectedGendre>(_selectGendre);
    on<OnDefaultGendre>(_selectDefault);
  }

  _selectGendre(OnSelectedGendre event, Emitter<FilterGenreState> emit) async {
    final result = await moveUseCase.execute();

    result.fold(
      (failure) => emit(FilterGenreError()),
      (data) {
        if (data.isNotEmpty) {
          for (var item in data) {
            if (item.genreIds
                .where((item) => item == event.id)
                .toList()
                .isNotEmpty) {
              print(data.length);
              emit(FilterGenreHasData(data));
            }
          }
        }
      },
    );
  }

  _selectDefault(OnDefaultGendre event, Emitter<FilterGenreState> emit) async {
    int _idDefault = 0;
    final result = await moveUseCase.execute();
    final resultGenre = await genreUseCase.execute();
    emit(FilterGenreLoading());

    resultGenre.fold(
      (failure) => 0,
      (data) {
        _idDefault = data.genres[0].id;
      },
    );

    result.fold(
      (failure) => emit(FilterGenreError()),
      (data) {
        if (data.isNotEmpty) {
          for (var item in data) {
            if (item.genreIds
                .where((item) => item == _idDefault)
                .toList()
                .isNotEmpty) {
              emit(FilterGenreHasData(data));
            }
          }
        }
      },
    );
  }
}

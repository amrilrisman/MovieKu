import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core/data/models/gendres_model.dart';
import 'package:equatable/equatable.dart';
import 'package:home/domain/use_case/genre_usecase.dart';

part 'data_genres_event.dart';
part 'data_genres_state.dart';

class DataGenresBloc extends Bloc<DataGenresEvent, DataGenresState> {
  final GenreUsecase genreUsecase;
  DataGenresBloc(this.genreUsecase) : super(DataGenresInitial()) {
    on<OnGetDataGenres>(_getDataGenre);
  }

  _getDataGenre(OnGetDataGenres event, Emitter<DataGenresState> emit) async {
    emit(DataGenresLoading());
    final result = await genreUsecase.execute();
    result.fold(
      (failure) => emit(DataGenresError(GendreModels.fromJson({}))),
      (data) => emit(DataGenresHasData(data)),
    );
  }
}

import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/data/models/detail_movie_model.dart';
import 'package:detail_movie/presentation/bloc/detail_movie_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../data_dumy/read_data_dumy_test.dart';
import '../../helper_test/helper_test.mocks.dart';

void main() {
  late MockDetailMovieUseCase mockDetailUsecase;
  // late MockDetailMovieBloc mockDetailMovieBloc;
  late DetailMovieBloc detailMovieBloc;

  setUp(
    () {
      mockDetailUsecase = MockDetailMovieUseCase();
      detailMovieBloc = DetailMovieBloc(mockDetailUsecase);
    },
  );

  final dataDumy = DetailMovieModels.fromJson(json.decode(
    readJson('data_dumy/dumy_detail_movie.json'),
  ));

  final id = '1';

  blocTest<DetailMovieBloc, DetailMovieState>(
    'should emits [DetailMovieLoading, DetailMovieHasData] when MyEvent is added. OnDetailMovieEvent Successfully',
    build: () {
      when(mockDetailUsecase.execute(id: id)).thenAnswer(
        (_) async => Right(dataDumy),
      );
      return detailMovieBloc;
    },
    act: (bloc) => bloc.add(OnEventDetailMovie(id)),
    expect: () => <DetailMovieState>[
      DetailMovieLoading(),
      DetailMovieHasData(dataDumy)
      // MyState,
    ],
  );
  blocTest<DetailMovieBloc, DetailMovieState>(
    'should emits [DetailMovieLoading, DetailMovieHasData] when MyEvent is added. OnDetailMovieEvent UnSuccessfully server error ',
    build: () {
      when(mockDetailUsecase.execute(id: id)).thenAnswer(
        (_) async => const Left(ServerFailure('lostConnecting')),
      );
      return detailMovieBloc;
    },
    act: (bloc) => bloc.add(OnEventDetailMovie(id)),
    expect: () => <DetailMovieState>[
      DetailMovieLoading(),
      // DetailMovieHasData(dataDumy)
      const DetailMovieError("Server error")
      // MyState,
    ],
  );
}

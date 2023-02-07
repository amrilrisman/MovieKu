// Mocks generated by Mockito 5.3.2 from annotations
// in detail_movie/test/helper_test/helper_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:bloc/bloc.dart' as _i10;
import 'package:core/core.dart' as _i2;
import 'package:core/data/models/detail_movie_model.dart' as _i7;
import 'package:core/data/models/gendres_model.dart' as _i8;
import 'package:core/data/models/movie_model.dart' as _i9;
import 'package:dartz/dartz.dart' as _i3;
import 'package:detail_movie/domain/usecase/detail_movie_usecase.dart' as _i4;
import 'package:detail_movie/presentation/bloc/detail_movie_bloc.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeMovieRepository_0 extends _i1.SmartFake
    implements _i2.MovieRepository {
  _FakeMovieRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieRemoteSource_2 extends _i1.SmartFake
    implements _i2.MovieRemoteSource {
  _FakeMovieRemoteSource_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDetailMovieUseCase_3 extends _i1.SmartFake
    implements _i4.DetailMovieUseCase {
  _FakeDetailMovieUseCase_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDetailMovieState_4 extends _i1.SmartFake
    implements _i5.DetailMovieState {
  _FakeDetailMovieState_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DetailMovieUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockDetailMovieUseCase extends _i1.Mock
    implements _i4.DetailMovieUseCase {
  MockDetailMovieUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieRepository get movieRemote => (super.noSuchMethod(
        Invocation.getter(#movieRemote),
        returnValue: _FakeMovieRepository_0(
          this,
          Invocation.getter(#movieRemote),
        ),
      ) as _i2.MovieRepository);
  @override
  _i6.Future<_i3.Either<_i2.Failure, _i7.DetailMovieModels>> execute(
          {required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#id: id},
        ),
        returnValue:
            _i6.Future<_i3.Either<_i2.Failure, _i7.DetailMovieModels>>.value(
                _FakeEither_1<_i2.Failure, _i7.DetailMovieModels>(
          this,
          Invocation.method(
            #execute,
            [],
            {#id: id},
          ),
        )),
      ) as _i6.Future<_i3.Either<_i2.Failure, _i7.DetailMovieModels>>);
}

/// A class which mocks [MovieRepositoryImplementation].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepositoryImplementation extends _i1.Mock
    implements _i2.MovieRepositoryImplementation {
  MockMovieRepositoryImplementation() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieRemoteSource get movieRemoteSource => (super.noSuchMethod(
        Invocation.getter(#movieRemoteSource),
        returnValue: _FakeMovieRemoteSource_2(
          this,
          Invocation.getter(#movieRemoteSource),
        ),
      ) as _i2.MovieRemoteSource);
  @override
  _i6.Future<_i3.Either<_i2.Failure, _i8.GendreModels>> getGendres() =>
      (super.noSuchMethod(
        Invocation.method(
          #getGendres,
          [],
        ),
        returnValue:
            _i6.Future<_i3.Either<_i2.Failure, _i8.GendreModels>>.value(
                _FakeEither_1<_i2.Failure, _i8.GendreModels>(
          this,
          Invocation.method(
            #getGendres,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i2.Failure, _i8.GendreModels>>);
  @override
  _i6.Future<_i3.Either<_i2.Failure, _i7.DetailMovieModels>> dataMovieById(
          String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #dataMovieById,
          [id],
        ),
        returnValue:
            _i6.Future<_i3.Either<_i2.Failure, _i7.DetailMovieModels>>.value(
                _FakeEither_1<_i2.Failure, _i7.DetailMovieModels>(
          this,
          Invocation.method(
            #dataMovieById,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i2.Failure, _i7.DetailMovieModels>>);
  @override
  _i6.Future<_i3.Either<_i2.Failure, List<_i9.MovieModels>>> getPopular() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopular,
          [],
        ),
        returnValue:
            _i6.Future<_i3.Either<_i2.Failure, List<_i9.MovieModels>>>.value(
                _FakeEither_1<_i2.Failure, List<_i9.MovieModels>>(
          this,
          Invocation.method(
            #getPopular,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i2.Failure, List<_i9.MovieModels>>>);
}

/// A class which mocks [DetailMovieBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockDetailMovieBloc extends _i1.Mock implements _i5.DetailMovieBloc {
  MockDetailMovieBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.DetailMovieUseCase get useCase => (super.noSuchMethod(
        Invocation.getter(#useCase),
        returnValue: _FakeDetailMovieUseCase_3(
          this,
          Invocation.getter(#useCase),
        ),
      ) as _i4.DetailMovieUseCase);
  @override
  _i5.DetailMovieState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeDetailMovieState_4(
          this,
          Invocation.getter(#state),
        ),
      ) as _i5.DetailMovieState);
  @override
  _i6.Stream<_i5.DetailMovieState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i5.DetailMovieState>.empty(),
      ) as _i6.Stream<_i5.DetailMovieState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);
  @override
  void add(_i5.DetailMovieEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i5.DetailMovieEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i5.DetailMovieState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i5.DetailMovieEvent>(
    _i10.EventHandler<E, _i5.DetailMovieState>? handler, {
    _i10.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onTransition(
          _i10.Transition<_i5.DetailMovieEvent, _i5.DetailMovieState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  void onChange(_i10.Change<_i5.DetailMovieState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

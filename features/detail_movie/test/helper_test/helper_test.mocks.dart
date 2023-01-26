// Mocks generated by Mockito 5.3.2 from annotations
// in detail_movie/test/helper_test/helper_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:core/core.dart' as _i2;
import 'package:core/data/models/detail_movie_model.dart' as _i6;
import 'package:core/data/models/gendres_model.dart' as _i7;
import 'package:core/data/models/movie_model.dart' as _i8;
import 'package:dartz/dartz.dart' as _i3;
import 'package:detail_movie/domain/usecase/detail_movie_usecase.dart' as _i4;
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
  _i5.Future<_i3.Either<_i2.Failure, _i6.DetailMovieModels>> execute(
          {required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#id: id},
        ),
        returnValue:
            _i5.Future<_i3.Either<_i2.Failure, _i6.DetailMovieModels>>.value(
                _FakeEither_1<_i2.Failure, _i6.DetailMovieModels>(
          this,
          Invocation.method(
            #execute,
            [],
            {#id: id},
          ),
        )),
      ) as _i5.Future<_i3.Either<_i2.Failure, _i6.DetailMovieModels>>);
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
  _i5.Future<_i3.Either<_i2.Failure, _i7.GendreModels>> getGendres() =>
      (super.noSuchMethod(
        Invocation.method(
          #getGendres,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i2.Failure, _i7.GendreModels>>.value(
                _FakeEither_1<_i2.Failure, _i7.GendreModels>(
          this,
          Invocation.method(
            #getGendres,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i2.Failure, _i7.GendreModels>>);
  @override
  _i5.Future<_i3.Either<_i2.Failure, _i6.DetailMovieModels>> dataMovieById(
          String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #dataMovieById,
          [id],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i2.Failure, _i6.DetailMovieModels>>.value(
                _FakeEither_1<_i2.Failure, _i6.DetailMovieModels>(
          this,
          Invocation.method(
            #dataMovieById,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i2.Failure, _i6.DetailMovieModels>>);
  @override
  _i5.Future<_i3.Either<_i2.Failure, List<_i8.MovieModels>>> getPopular() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopular,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i2.Failure, List<_i8.MovieModels>>>.value(
                _FakeEither_1<_i2.Failure, List<_i8.MovieModels>>(
          this,
          Invocation.method(
            #getPopular,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i2.Failure, List<_i8.MovieModels>>>);
}

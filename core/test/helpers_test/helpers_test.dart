import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  ServiceApi,
  MovieRemoteSource,
  MovieRemoteSourceImplementation,
  MovieRepository,
  MovieRepositoryImplementation,
  Dio,
])
void main() {}

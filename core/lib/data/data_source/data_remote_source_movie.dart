import 'package:core/core.dart';
import 'package:core/data/models/detail_movie_model.dart';
import 'package:core/data/models/gendres_model.dart';
import 'package:core/data/models/movie_model.dart';
import 'package:flutter/animation.dart';

abstract class MovieRemoteSource {
  Future<GendreModels> getGendres();
  Future<MovieModels> getPopular();
  Future<DetailMovie> detailById({required String id});
}

class MovieRemoteSourceImplementation extends MovieRemoteSource {
  final ServiceApi serviceApi;

  MovieRemoteSourceImplementation(this.serviceApi);
  @override
  Future<GendreModels> getGendres() async {
    try {
      final result = await serviceApi.get(
        url: ApiUrl.gendres,
        parameter: {'api_key': ApiUrl.keyApi},
      );
      return GendreModels.fromJson(result);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<DetailMovie> detailById({required String id}) async {
    try {
      final result = await serviceApi.get(
          url: '${ApiUrl.detilById}/$id',
          parameter: {'api_key': ApiUrl.keyApi});
      return DetailMovie.fromJson(result);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<MovieModels> getPopular() async {
    try {
      final result = await serviceApi.get(
          url: ApiUrl.popularMoview, parameter: {'api_key': ApiUrl.keyApi});
      return MovieModels.fromJson(result['results']);
    } catch (e) {
      throw ServerException();
    }
  }
}

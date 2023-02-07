import 'package:core/core.dart';
import 'package:core/data/models/detail_movie_model.dart';
import 'package:core/data/models/gendres_model.dart';
import 'package:core/data/models/movie_model.dart';

abstract class MovieRemoteSource {
  Future<GendreModels> getGendres();
  Future<List<MovieModels>> getPopular();
  Future<DetailMovieModels> detailById({required String id});
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
  Future<DetailMovieModels> detailById({required String id}) async {
    try {
      final result = await serviceApi.get(
          url: '${ApiUrl.detilById}/$id',
          parameter: {'api_key': ApiUrl.keyApi});
      return DetailMovieModels.fromJson(result);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModels>> getPopular() async {
    try {
      final Map<String, dynamic> result = await serviceApi.get(
          url: ApiUrl.popularMoview, parameter: {'api_key': ApiUrl.keyApi});
      final List data = result['results'];

      return data.map((e) => MovieModels.fromJson(e)).toList();
    } catch (e) {
      throw ServerException();
    }
  }
}

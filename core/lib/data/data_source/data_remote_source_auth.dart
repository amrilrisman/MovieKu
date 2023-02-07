import 'package:core/data/data_source/service/service_api_dio.dart';
import 'package:core/domain/entity/user_login_entity.dart';
import 'package:core/utils/db_failure.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/url.dart';

abstract class AuthRemoteSource {
  Future<Map> userLogin(UserLoginEntity userLogin);
  Future<Map> guestLogin();
}

class AuthRemoteSourceImplementation extends AuthRemoteSource {
  final ServiceApi serviceApi;

  AuthRemoteSourceImplementation(this.serviceApi);

  @override
  Future<Map> guestLogin() async {
    try {
      final result = await serviceApi
          .get(url: ApiUrl.guestLogin, parameter: {'api_key': ApiUrl.keyApi});
      return result;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Map> userLogin(UserLoginEntity userLogin) async {
    try {
      final result = await serviceApi.postData(
          urlPath: ApiUrl.userLogin,
          body: userLogin.toJson(),
          parameter: {'api_key': ApiUrl.keyApi});

      return result;
    } catch (e) {
      throw ServerException();
    }
  }
}

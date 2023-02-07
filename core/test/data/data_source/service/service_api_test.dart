import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import '../../../data_dumy/read_data_dumy.dart';
import '../../../helpers_test/helpers_test.mocks.dart';

void main() {
  late MockServiceApi _mockServiceApi;

  final dataDumyListMovie = readJson('data_dumy/dumy_list_movie.json');
  setUp(() {
    _mockServiceApi = MockServiceApi();
  });
  group('check service api succes positif response', () {
    test('Check Service Api method Post', () async {
      when(
        _mockServiceApi.get(
          url: ApiUrl.baseUrl + ApiUrl.gendres,
          parameter: {
            'api_key': ApiUrl.keyApi,
          },
        ),
      ).thenAnswer((realInvocation) async => ResponseBody.fromString(
              readJson('data_dumy/dumy_list_movie.json'), 200,
              statusMessage: readJson('data_dumy/dumy_list_movie.json'))
          .statusMessage);

      final result = await _mockServiceApi.get(
        url: ApiUrl.baseUrl + ApiUrl.gendres,
        parameter: {
          'api_key': ApiUrl.keyApi,
        },
      );
      expect(result, dataDumyListMovie);
    });
  });
}

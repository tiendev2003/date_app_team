import 'package:date_app_team/core/api/api.dart';
import 'package:date_app_team/core/config/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('Api', () {
    late Api api;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      api = Api();
    });

    test('should have correct baseUrl and headers', () {
      expect(api.sendRequest.options.baseUrl, Config.baseUrl);
      expect(api.sendRequest.options.headers, Config.header);
    });

    test('should log requests', () {
      final interceptors = api.sendRequest.interceptors;
      expect(interceptors.any((i) => i is PrettyDioLogger), isTrue);
    });

    test('should make a GET request', () async {
      when(mockDio.get(any as String)).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: ''),
            data: 'response data',
          ));

      final response = await api.sendRequest.get('/test');
      expect(response.data, 'response data');
    });
  });
}
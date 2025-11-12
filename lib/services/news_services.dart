import 'package:dio/dio.dart';
import 'package:news_app/constants/constants.dart';

class NewsServices {
  // Add sensible timeouts and keep JSON response type.
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiUrls.baseUrl,
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<dynamic> fetchNews() async {
    final stopwatch = Stopwatch()..start();
    final response = await _dio.get('?apikey=${ApiUrls.apiKey}&language=en');
    stopwatch.stop();
    // report network time
    // Note: debugPrint kept intentionally for quick diagnostics; remove in production.
    // use millisecond precision to understand latency.
    // ignore: avoid_print
    print('NewsServices.fetchNews network time: ${stopwatch.elapsedMilliseconds} ms');
    return response.data;
  }

  Future<dynamic> fetchNewsBySearching(String title) async {
    final stopwatch = Stopwatch()..start();
    final response = await _dio.get('?apikey=${ApiUrls.apiKey}&q=$title&language=en');
    stopwatch.stop();
    // ignore: avoid_print
    print('NewsServices.fetchNewsBySearching network time: ${stopwatch.elapsedMilliseconds} ms');
    return response.data;
  }
}

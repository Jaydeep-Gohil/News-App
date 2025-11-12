import 'package:dio/dio.dart';
import 'package:news_app/constants/constants.dart';

class NewsServices {
  
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

    print('NewsServices.fetchNews network time: ${stopwatch.elapsedMilliseconds} ms');
    return response.data;
  }

  Future<dynamic> fetchNewsBySearching(String title) async {
    final stopwatch = Stopwatch()..start();
    final response = await _dio.get('?apikey=${ApiUrls.apiKey}&q=$title&language=en');
    stopwatch.stop();
  
    print('NewsServices.fetchNewsBySearching network time: ${stopwatch.elapsedMilliseconds} ms');
    return response.data;
  }
}

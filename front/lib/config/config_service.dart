import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class ConfigService {
  var dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options) async {
        final prefs = await SharedPreferences.getInstance();
        final _myToken = prefs.getString('acces_token');
        options.headers.addAll({
          'authorization': 'Bearer $_myToken',
          'content-type': 'application/json',
        });
        options.baseUrl = '';
        options.receiveTimeout = 15000;
        options.connectTimeout = 15000;
        options.followRedirects = false;
        options.validateStatus = (status) {
          return status < 500;
        };
        return options;
      }),
    );
  Response response;
}

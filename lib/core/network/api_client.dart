import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../../product/constants/service_constants.dart';
import '../../product/services/shared_preferences_service.dart';
import '../enum/request_type_enum.dart';
import '../utils/get_locale.dart';

abstract class IApiClient {
  Future<Response> fetch({
    required String path,
    Map<String, String>? headers,
    Object? body,
    RequestType requestType = RequestType.get,
    bool useAuthorizationHeader = true,
  });
}

@LazySingleton(as: IApiClient)
class ApiClient implements IApiClient {
  final String baseUrl = ServiceConstants.apiUrl;

  late Map<String, String> _baseHeaders;
  final ISharedPreferencesService _sharedPreferencesService;

  ApiClient(this._sharedPreferencesService) {
    _baseHeaders = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
  }

  @override
  Future<Response> fetch({
    required String path,
    Map<String, String>? headers,
    Object? body,
    RequestType requestType = RequestType.get,
    bool useAuthorizationHeader = true,
  }) async {
    final String languageCode = _getLang;

    final langHeader = {'Accept-Language': languageCode};
    headers = {...?headers, ...langHeader};

    if (useAuthorizationHeader) await _addAuthorizationHeader();

    final Response response =
        await _sendRequest(requestType, path, body, headers);

    Response? afterResponse =
        await _checkStatusCode(response, headers: headers, body: body);

    if (afterResponse != null) return afterResponse;

    return response;
  }

  String get _getLang {
    final id = _sharedPreferencesService.getLanguage();

    final Locale locale = getLocale(id);

    final String acceptLanguage =
        '${locale.languageCode}-${locale.countryCode}';

    return acceptLanguage;
  }

  Future<void> _addAuthorizationHeader() async {
    final token = await _sharedPreferencesService.getToken();
    _baseHeaders = {
      ..._baseHeaders,
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };
  }

  Future<Response> _sendRequest(RequestType requestType, String path,
      Object? body, Map<String, String>? headers) {
    switch (requestType) {
      case RequestType.post:
        return http.post(Uri.parse(baseUrl + path),
            body: jsonEncode(body), headers: {..._baseHeaders, ...?headers});
      case RequestType.put:
        return http
            .put(Uri.parse(baseUrl + path), body: jsonEncode(body), headers: {
          ..._baseHeaders,
          ...?headers,
        });
      case RequestType.patch:
        return http.patch(Uri.parse(baseUrl + path),
            body: jsonEncode(body), headers: {..._baseHeaders, ...?headers});
      case RequestType.delete:
        return http.delete(Uri.parse(baseUrl + path),
            body: jsonEncode(body), headers: {..._baseHeaders, ...?headers});
      default:
        return http.get(Uri.parse(baseUrl + path),
            headers: {..._baseHeaders, ...?headers});
    }
  }

  Future<Response?> _checkStatusCode(Response response,
      {Map<String, String>? headers, Object? body}) async {
    switch (response.statusCode) {
      case HttpStatus.unauthorized:
        throw Exception("Unauthorized");

      case HttpStatus.temporaryRedirect:
        Response redirect = await http.post(
            Uri.parse(response.headers['location'].toString()),
            body: jsonEncode(body),
            headers: {..._baseHeaders, ...?headers});
        return redirect;

      default:
        return null;
    }
  }
}

import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GeoCodingCall {
  static Future<ApiCallResponse> call({
    String? latlang = '52.02880263828185, -0.7322820405210613',
    String? key = 'AIzaSyCgoDmUJj6Lo8OLftHP0dmsGhlJmlzknUo',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GeoCoding',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latlang}&key=${key}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FirebaseLoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? webKey = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}",
  "returnSecureToken": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Firebase Login',
      apiUrl:
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${webKey}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}

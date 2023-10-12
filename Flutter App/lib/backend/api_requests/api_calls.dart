import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class BssCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'BSS',
      apiUrl: 'https://pluginprogress.com/api/bss/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
      );
  static dynamic address(dynamic response) => getJsonField(
        response,
        r'''$[:].address''',
      );
  static dynamic lat(dynamic response) => getJsonField(
        response,
        r'''$[:].lat''',
      );
  static dynamic lng(dynamic response) => getJsonField(
        response,
        r'''$[:].lng''',
      );
  static dynamic battery1Available(dynamic response) => getJsonField(
        response,
        r'''$[:].Battery1Available''',
      );
  static dynamic battery2Available(dynamic response) => getJsonField(
        response,
        r'''$[:].Battery2Available''',
      );
  static dynamic battery1Percentage(dynamic response) => getJsonField(
        response,
        r'''$[:].Battery1Percentage''',
      );
  static dynamic battery2Percentage(dynamic response) => getJsonField(
        response,
        r'''$[:].Battery2Percentage''',
      );
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

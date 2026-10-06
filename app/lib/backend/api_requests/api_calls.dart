import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start NocoBaseAPI Group Code

class NocoBaseAPIGroup {
  static String getBaseUrl() => const String.fromEnvironment(
        'NOCOBASE_BASE_URL',
        defaultValue: 'http://localhost:13001',
      );
  static Map<String, String> headers = {};
  static GetServiceRecordsCall getServiceRecordsCall = GetServiceRecordsCall();
  static NocoBaseLoginCall nocoBaseLoginCall = NocoBaseLoginCall();
  static GetClientsCall getClientsCall = GetClientsCall();
  static CreateServiceRecordCall createServiceRecordCall =
      CreateServiceRecordCall();
}

class GetServiceRecordsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = NocoBaseAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetServiceRecords',
      apiUrl: '${baseUrl}/api/service_records:list',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'appends[]': "client",
        'sort[]': "-createdAt",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? serviceRecordsList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<bool>? alertSentList(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].alert_sent''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class NocoBaseLoginCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) async {
    final baseUrl = NocoBaseAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "account": ${username == null ? 'null' : '"${escapeStringForJson(username)}"'},
  "password": ${password == null ? 'null' : '"${escapeStringForJson(password)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'NocoBaseLogin',
      apiUrl: '${baseUrl}/api/auth:signIn',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? loginToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
}

class GetClientsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = NocoBaseAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetClients',
      apiUrl: '${baseUrl}/api/clients:list',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateServiceRecordCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? clientId,
    String? serviceDate = '',
    String? serviceType = '',
    int? serviceMinutes,
    String? notes = '',
    bool? fall,
    String? abnormalDescription = '',
  }) async {
    final baseUrl = NocoBaseAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "client": {
    "id": ${clientId}
  },
  "service_date": ${serviceDate == null ? 'null' : '"${escapeStringForJson(serviceDate)}"'},
  "service_type": ${serviceType == null ? 'null' : '"${escapeStringForJson(serviceType)}"'},
  "service_minutes": ${serviceMinutes},
  "notes": ${notes == null ? 'null' : '"${escapeStringForJson(notes)}"'},
  "fall": ${fall},
  "abnormal_description": ${abnormalDescription == null ? 'null' : '"${escapeStringForJson(abnormalDescription)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateServiceRecord',
      apiUrl: '${baseUrl}/api/service_records:create',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End NocoBaseAPI Group Code

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

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}

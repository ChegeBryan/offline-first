import 'dart:io';

import 'package:dio/dio.dart';

abstract class Endpoint {
  String get path;
  RequestMethod get method;
  RequestBody get body;
  Map<String, String>? get queryParams;
  Map<String, String>? get pathParams;
  bool get needsAuth;

  Map<String, String>? get headers {
    var defaultHeaders = <String, String>{};
    defaultHeaders['Accept'] = 'application/json';
    defaultHeaders['platform'] = Platform.isAndroid ? 'android' : 'ios';
    defaultHeaders['Accept-Language'] = Platform.localeName.split('_')[0];
    return defaultHeaders;
  }

  RequestOptions toRequestOptions() {
    var resolvedPath = path;

    // Replace path parameters (e.g., '/users/{id}' → '/users/123')
    if (pathParams != null) {
      pathParams!.forEach((key, value) {
        resolvedPath = resolvedPath.replaceAll('{$key}', value);
      });
    }

    return RequestOptions(
      path: resolvedPath,
      method: method.name.toUpperCase(),
      headers: headers,
      queryParameters: queryParams,
      data: body.toDioData(),
      extra: {'authorize': needsAuth},
    );
  }
}

enum RequestMethod { get, post, put, patch, delete }

class RequestBody {
  final dynamic data;
  final String? type;

  const RequestBody.none() : data = null, type = null;

  RequestBody.json(Map<String, dynamic> json)
    : data = json,
      type = 'application/json';

  RequestBody.formData(MultiPartFormData formData)
    : data = formData.toDioFormData(),
      type = 'multipart/form-data';

  dynamic toDioData() {
    if (type == 'multipart/form-data') {
      return data;
    } else if (type == 'application/json') {
      return data;
    } else {
      return null;
    }
  }
}

class MultiPartFormData {
  final Map<String, dynamic> parameters;

  MultiPartFormData({
    required this.parameters,
  });

  FormData toDioFormData() {
    final dioFormData = FormData();

    parameters.forEach((key, value) {
      dioFormData.fields.add(MapEntry(key, value.toString()));
    });

    return dioFormData;
  }
}

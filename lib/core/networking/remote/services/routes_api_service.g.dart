// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _RoutesApiService implements RoutesApiService {
  _RoutesApiService(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    baseUrl ??= 'https://routes.googleapis.com/directions/v2:computeRoutes/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<GetRoutesResponse> getRoutes({
    required String apiKey,
    required String contentType,
    required String xGoogleFieldMask,
    required GetRoutesRequestBody getRoutesRequestBody,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'X-Goog-Api-Key': apiKey,
      r'Content-Type': contentType,
      r'X-Goog-FieldMask': xGoogleFieldMask,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(getRoutesRequestBody.toJson());
    final _options = _setStreamType<GetRoutesResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
        .compose(
          _dio.options,
          '/',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetRoutesResponse _value;
    try {
      _value = GetRoutesResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

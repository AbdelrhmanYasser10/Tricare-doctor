import 'package:dio/dio.dart';

class Failure implements Exception {
  final String callback;
  const Failure(this.callback);

  factory Failure.apiFailure(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout ||
          DioExceptionType.sendTimeout ||
          DioExceptionType.connectionError:
        return const Failure('No Connection To The Server.');
      case DioExceptionType.receiveTimeout:
        return const Failure('Server Connection Error');
      case DioExceptionType.badCertificate:
        return const Failure('Bad Certification');
      case DioExceptionType.cancel:
        return const Failure('Request Has Been Cancelled');
      case DioExceptionType.unknown:
        return const Failure('UnKnown Failure Please Try Again Later');
      case DioExceptionType.badResponse:
        final badResponseFailure = _badResponseFailure(exception);
        return Failure(badResponseFailure);
    }
  }

  static String _badResponseFailure(DioException exception) {
    switch (exception.response!.statusCode) {
      case 400:
        return 'The server cannot process the request due to user conflict(Bad Request ${exception.response!.data}).';
      case 401 || 403:
        return 'Unauthorized.(The client does not have access rights to the content).';
      case 404:
        return 'The server cannot find the requested resource (not recognized).';
      case 405:
        return 'The request method is known by the server but is not supported by the target resource.';
      case 409:
        return 'This response is sent when a request conflicts with the current state of the server.';
      case 415:
        return 'The media format of the requested data is not supported by the server';
      case 429:
        return 'The user has sent too many requests in a given amount of time ("rate limiting").';
      case 451:
        return 'The user agent requested a resource that cannot legally be provided';
      case 500:
        return 'Internal Server Error';
      case 503:
        return 'The server is not ready to handle the request.';
      default:
        return 'Unknown Error (Code: ${exception.response!.statusCode}).';
    }
  }
}
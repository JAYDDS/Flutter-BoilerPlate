import 'dart:async';
import 'package:api_handler/core/exports.dart';
import 'package:api_handler/models/response/book_service_response.dart';


class AuthRepository extends ApiResponseHandler {
  final ApiResponseProvider _apiResponseProvider =
      ApiResponseProvider(header: ApiConstants.headerWithAuthToken(SharedPrefService.getAuthToken));

  /// login
  Future<ApiHttpResult> login(String requestModel) async {
    final uri = ApiConstants.endpointUri(path: ApiConstants.login);

    APIResponse result = await _apiResponseProvider.requestAPI(uri, headers: ApiConstants.headerWithoutAccessToken(), body: requestModel);

    return responseHandler(result: result, json: ServiceResponseModel.parseInfo);
  }
}
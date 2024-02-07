import 'package:vyser/shared/api_call.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class BaseAPI {
  BaseAPI({
    APICallGroup? apiCallGroup,
    this.route = '',
  }) : _apiCallGroup = apiCallGroup ?? getIt.get<APICallGroup>();

  final APICallGroup _apiCallGroup;
  final String route;

  APICallGroup get apiCallGroup => _apiCallGroup;

  String getBaseUrlWithSuffix({String? suffix}) {
    if (suffix != null) {
      return apiCallGroup.getBaseUrlWithSuffix(suffix: '$route$suffix');
    }
    String url = apiCallGroup.getBaseUrlWithSuffix(suffix: route);
    return url;
  }
}

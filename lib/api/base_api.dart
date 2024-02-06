import 'package:vyser/shared/api_call.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class BaseAPI {
  BaseAPI({
    APICallGroup? apiCallGroup,
    String route = '',
  }) : apiCallGroup = apiCallGroup ?? getIt.get<APICallGroup>();

  APICallGroup apiCallGroup;
  String route = '';

  String getBaseUrlWithSuffix({String? suffix}) {
    if (suffix != null) {
      return apiCallGroup.getBaseUrlWithSuffix(suffix: '$route$suffix');
    }
    return apiCallGroup.getBaseUrlWithSuffix(suffix: route);
  }
}

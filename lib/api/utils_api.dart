import 'package:dio/dio.dart';
import 'package:vyser/api/base_api.dart';
import 'package:vyser/models/index.dart';
import 'package:image_picker/image_picker.dart';

class UtilsAPI extends BaseAPI {
  UtilsAPI({super.apiCallGroup}) : super(route: '/utils');

  Future<StorageModel> uploadFileToStorage(XFile file) async {
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path),
    });

    final response = await apiCallGroup.getHandler().post(
          getBaseUrlWithSuffix(suffix: '/storage'),
          data: formData,
          options: Options(headers: await apiCallGroup.getHeaders()),
        );
    return StorageModel.fromJson(response.data);
  }

  Future<StorageModel> uploadFileToTemporaryStorage(XFile file) async {
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path),
    });

    final response = await apiCallGroup.getHandler().post(
          getBaseUrlWithSuffix(suffix: '/storage/temp'),
          data: formData,
          options: Options(headers: await apiCallGroup.getHeaders()),
        );
    return StorageModel.fromJson(response.data);
  }
}

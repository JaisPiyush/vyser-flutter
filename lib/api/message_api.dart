import 'package:dio/dio.dart';
import 'package:vyser/api/base_api.dart';
import 'package:vyser/models/index.dart';

class MessageAPI extends BaseAPI {
  MessageAPI({super.apiCallGroup}) : super(route: '/messages');

  Future<List<MessageContent>> sendMessage({
    required MessageContent message,
    required String text,
    required String sessionId,
  }) async {
    final response = await apiCallGroup.getHandler().post(
          getBaseUrlWithSuffix(),
          data: {
            "message": message.toJson(),
            'text': text,
            'sessionId': sessionId
          },
          options: Options(headers: await apiCallGroup.getHeaders()),
        );
    if (response.statusCode != 201) {
      throw Exception('Failed to send message');
    }
    final messages = (response.data['messages'] as List)
        .map((e) => MessageContent.fromJson(e['message']))
        .toList();
    return messages;
  }

  Future<List<MessageContent>> getMessages() async {
    final response = await apiCallGroup.getHandler().get(
          getBaseUrlWithSuffix(),
          options: Options(headers: await apiCallGroup.getHeaders()),
        );
    if (response.statusCode != 200) {
      throw Exception('Failed to get messages');
    }
    // print(response.data['messages'][0]);
    return (response.data['messages'] as List)
        .map((e) => MessageContent.fromJson(e['message']))
        .toList();
  }
}

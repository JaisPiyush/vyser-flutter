import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vyser/shared/api_call.dart';
import 'package:vyser/shared/custom_actions.dart';
import 'package:vyser/shared/enums.dart';
import 'package:vyser/views/messages/bloc/messages_events.dart';
import 'package:vyser/views/messages/bloc/messags_bloc.dart';

final getIt = GetIt.instance;

class HomePageModel<T extends StatefulWidget> extends State<T>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late TextEditingController messageTextController;
  late ImagePicker imagePicker;

  final customActions = getIt.get<CustomActions>();
  final utilsAPI = getIt.get<APICallGroup>().utilsAPI!;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    messageTextController = TextEditingController();
    imagePicker = ImagePicker();
  }

  @override
  void dispose() {
    tabController.dispose();
    messageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  Future<void> pickImageAndSendMessage(MessagesBloc bloc) async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageUploadData =
          await utilsAPI.uploadFileToTemporaryStorage(pickedFile);
      final sendableMessage = customActions.getSendableMessage(
          MessageType.image, imageUploadData.url);
      bloc.add(SendMessageEvent(
          message: sendableMessage, text: imageUploadData.gsSchemaUri));
    }
  }

  void sendTextMessage(MessagesBloc bloc) {
    if (messageTextController.text.isEmpty) return;
    final sendableMessage = customActions.getSendableMessage(
        MessageType.text, messageTextController.text);
    bloc.add(SendMessageEvent(
        message: sendableMessage, text: messageTextController.text));
    messageTextController.clear();
  }
}

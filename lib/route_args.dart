import 'package:vyser/models/index.dart';
import 'package:vyser/pages/view_items/view_items.dart';

class ViewItemsArgument {
  const ViewItemsArgument({this.name});

  final String? name;
}

class ItemDetailArgument {
  const ItemDetailArgument({this.item, required this.itemId});

  final Item? item;
  final String itemId;
}

class ItemActionArgument {
  final String actionId;
  final MessageContextPayload? payload;

  ItemActionArgument({required this.actionId, this.payload});
}

class EditOrItemsArgument {
  final String actionId;
  final MessageContextPayload? payload;
  final List<VisionSearchSingleResult> items;

  EditOrItemsArgument(
      {required this.actionId, this.payload, required this.items});
}

class RouteNames {
  static const SignInPage = 'signIn';
  static const HomePage = '/home';
  static const ViewItems = '/viewItems';
  static const EditOrAddItem = '/editOrAddItem';
}

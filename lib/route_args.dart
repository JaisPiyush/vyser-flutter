import 'package:vyser/models/index.dart';
import 'package:vyser/models/item/item.dart';

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

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

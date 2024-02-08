import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:vyser/models/index.dart';
import 'package:vyser/route_args.dart';
import 'package:vyser/shared/enums.dart';

class CustomActions {
  String getSessionId() {
    return Uuid().v4();
  }

  List<EditableItem> getEditableItemFromProductSet(
    List<ProductSet> fetchedProductSet,
  ) {
    return fetchedProductSet.map((productSet) {
      double price = 0;
      if (productSet.units.units.isNotEmpty) {
        price = productSet.units.units[0].price ?? 0;
      }
      EditableItem item = EditableItem(
        id: productSet.product_id,
        is_active: true,
        price: price,
        quantity: 0,
        reorder_level: 0,
        name: productSet.name,
      );
      return item;
    }).toList();
  }

  MessageContent getSendableMessage(MessageType type, String payload) {
    MessageContext ctx = MessageContext(
        payload: MessageContextPayload(),
        user: MessageContextUser(
            id: FirebaseAuth.instance.currentUser?.uid ?? '',
            isSentByUser: true));

    late MessageRichContent richContent;

    switch (type) {
      case MessageType.image:
        richContent = MessageRichContent(
          type: 'image',
        );
        richContent.rawUrl = payload;
        ctx.payload.image = payload;
        break;
      case MessageType.text:
        richContent = MessageRichContent(
          type: 'text',
        );
        richContent.text = payload;
        ctx.payload.name = payload;
        break;
    }

    return MessageContent(
      context: ctx,
      richContent: [richContent],
    );
  }

  List<CreateItem> getCreateItemStructFromEditableItem(
    List<ProductSet> fetchedProductSet,
    List<EditableItem> items,
  ) {
    List<CreateItem> dtos = [];
    for (EditableItem item in items) {
      List<ProductSet> products = fetchedProductSet
          .where((product) => product.product_id == item.id)
          .toList();
      if (products.isNotEmpty) {
        ProductSet product = products[0];
        CreateItem st = CreateItem(
            category_ids: product.categories,
            product_set_reference: product.product_id,
            creator: product.brand,
            name: product.name,
            descriptor_name: product.name,
            descriptor_code: product.id,
            descriptor_short_desc: product.description,
            descriptor_long_desc: product.description,
            descriptor_additional_desc: [],
            descriptor_media: [],
            descriptor_images: product.display_images,
            price: item.price,
            quantity: item.quantity,
            reorder_level: item.reorder_level,
            price_currency: 'INR',
            attributes: product.attributes,
            unit: product.units.units[0].measure);
        dtos.add(st);
      }
    }
    return dtos;
  }

  void _navigate(
    BuildContext context,
    String route,
    dynamic arguments,
  ) {
    Navigator.pushNamed(
      context,
      route,
      arguments: arguments,
    );
  }

  void performNavigationIntent(
    BuildContext context,
    String actionId,
    MessageContextPayload payload,
  ) {
    ItemActionArgument itemActionArgument = ItemActionArgument(
      actionId: actionId,
      payload: payload,
    );
    switch (actionId) {
      case "viewItems":
        _navigate(context, RouteNames.ViewItems, itemActionArgument);
        break;
    }
  }

  String getPublicUrlFromGSSchema(String gs) {
    return gs.replaceFirst('gs://', 'https://storage.googleapis.com/');
  }
}

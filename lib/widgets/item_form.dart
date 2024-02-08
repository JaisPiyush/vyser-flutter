import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vyser/models/index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ItemForm extends StatefulWidget {
  ItemForm(
      {super.key,
      required this.index,
      required this.item,
      required this.onSubmit});

  int index;
  EditableItem item;
  final void Function(int, EditableItem) onSubmit;

  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  late TextEditingController _priceController;
  late TextEditingController _quantityController;
  late TextEditingController _reorderLevelController;

  bool isActive = false;

  @override
  void initState() {
    super.initState();
    _priceController =
        TextEditingController(text: widget.item.price.toString());
    _quantityController =
        TextEditingController(text: widget.item.quantity.toString());
    _reorderLevelController =
        TextEditingController(text: widget.item.reorder_level.toString());
    isActive = widget.item.is_active;
  }

  @override
  void dispose() {
    _priceController.dispose();
    _quantityController.dispose();
    _reorderLevelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        ListTile(
          title: Text(
            appLocalizations.itemIsActive,
            style: theme.textTheme.labelMedium,
          ),
          trailing: Switch(
            value: isActive,
            activeTrackColor: Colors.green,
            onChanged: (value) {
              setState(() {
                isActive = value;
              });
            },
          ),
        ),
        TextField(
          controller: _priceController,
          decoration: InputDecoration(
            hintText: appLocalizations.price,
            labelText: appLocalizations.price,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        TextField(
          controller: _quantityController,
          decoration: InputDecoration(
            hintText: appLocalizations.quantity,
            labelText: appLocalizations.quantity,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        TextField(
          controller: _reorderLevelController,
          decoration: InputDecoration(
            hintText: appLocalizations.reorderLevel,
            labelText: appLocalizations.reorderLevel,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      EditableItem item = EditableItem(
                          id: widget.item.id,
                          is_active: isActive,
                          price: double.parse(_priceController.text),
                          quantity: double.parse(_quantityController.text),
                          reorder_level:
                              double.parse(_reorderLevelController.text),
                          name: widget.item.name);
                      widget.onSubmit(widget.index, item);
                    },
                    child: Text(
                      appLocalizations.continueBtn,
                      style: theme.textTheme.labelLarge!
                          .copyWith(color: Colors.white),
                    )))
          ],
        )
      ],
    );
  }
}

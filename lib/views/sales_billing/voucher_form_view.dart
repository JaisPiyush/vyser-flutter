import 'package:vyser/models/item.dart';
import 'package:vyser/views/widgets/index_based_record_controller.dart';
import 'package:vyser/views/widgets/quantity_editable_item_card.dart';
import 'package:vyser/views/widgets/sale_voucher_item_total.dart';
import 'package:flutter/material.dart';

class VoucherFormView extends StatefulWidget {
  final List<Item> items;
  const VoucherFormView({super.key, required this.items});

  @override
  State<VoucherFormView> createState() => _VoucherFormViewState();
}

class _VoucherFormViewState extends State<VoucherFormView> {
  late IndexBasedRecordController<double> _quantityController;

  List<Item> saleableItems = [];
  Map<String, double> quantityOfEachItem = {};

  @override
  void initState() {
    widget.items.forEach((item) {
      if (quantityOfEachItem[item.id] == null) {
        quantityOfEachItem[item.id!] = 1.0;
        saleableItems.add(item);
      } else {
        quantityOfEachItem[item.id!] = quantityOfEachItem[item.id!]! + 1.0;
      }
    });

    _quantityController = IndexBasedRecordController.fromList(
        saleableItems.map((e) => quantityOfEachItem[e.id!] ?? 1.0).toList());
    _quantityController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  double getTotalSum() {
    double sum = 0;
    for (int index = 0; index < saleableItems.length; index++) {
      sum += (saleableItems[index].selling_price ?? 0) *
          (_quantityController.record[index] ?? 1);
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: saleableItems.length,
              itemBuilder: (context, index) => QuantityEditableItemCard(
                  item: saleableItems[index],
                  quantity: _quantityController.record[index] ?? 1,
                  onQuantityChange: (quantity) {
                    _quantityController.setRecord(index, quantity);
                  },
                  onRemove: () {})),
        )),
        SaleVoucherItemTotal(
          itemTotal: getTotalSum(),
          taxTotal: 0,
          onNext: () {},
        )
      ],
    );
  }
}

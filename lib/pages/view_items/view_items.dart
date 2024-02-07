import 'package:flutter/material.dart';
import 'package:vyser/models/item/item.dart';
import 'package:vyser/widgets/nav_bar/nav_bar.dart';

class ViewItems extends StatefulWidget {
  @override
  State<ViewItems> createState() => _ViewItemsState();
}

class _ViewItemsState extends State<ViewItems> {
  List<dynamic> items = [
    {
      "id": 1,
      "images": [
        "https://storage.googleapis.com/vyser-product-database-asia-east1/1705394143458__di_0"
      ],
      "name": "Amul Gold Full Cream Fresh Milk 500 ml",
      "creator": "Amul"
    },
    {
      "id": 1,
      "images": [
        "https://storage.googleapis.com/vyser-product-database-asia-east1/1705394143458__di_0"
      ],
      "name": "Amul Gold Full Cream Fresh Milk 500 ml",
      "creator": "Amul"
    },
    {
      "id": 1,
      "images": [
        "https://storage.googleapis.com/vyser-product-database-asia-east1/1705394143458__di_0"
      ],
      "name": "Amul Gold Full Cream Fresh Milk 500 ml",
      "creator": "Amul"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: NavBarWidget(
        context: context,
        title: 'Items',
        showLeadingIcon: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: [
            Container(
              width: const Size.fromHeight(50).width,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: theme.inputDecorationTheme.border!.copyWith(
                        borderSide: const BorderSide(color: Colors.grey)),
                    filled: theme.inputDecorationTheme.filled,
                    iconColor: theme.inputDecorationTheme.iconColor,
                    focusedBorder: theme.inputDecorationTheme.focusedBorder,
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search)),
              ),
            ),
            const Divider(),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: GridView.builder(
                      itemCount: items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Card(
                            key: Key(index.toString()),
                            color: Colors.white,
                            child: Column(
                              children: [
                                Image.network(
                                  items[index]['images'][0],
                                  fit: BoxFit.contain,
                                ),
                                Expanded(
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.only(
                                        bottom: 8, left: 8),
                                    title: Text(
                                      items[index]['creator'],
                                      style: theme.textTheme.labelSmall,
                                    ),
                                    subtitle: Text(
                                      items[index]['name'],
                                      style: theme.textTheme.labelMedium!
                                          .copyWith(fontSize: 12),
                                    ),
                                  ),
                                )
                              ],
                            ));
                      })),
            )
          ],
        ),
      ),
    );
  }
}

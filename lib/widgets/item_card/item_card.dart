import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {super.key,
      required this.image,
      required this.creator,
      required this.name,
      this.onTap});

  final String image;
  final String creator;
  final String name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 100,
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: ListTile(
                  contentPadding: const EdgeInsets.only(bottom: 8, left: 8),
                  title: Text(
                    creator,
                    style: theme.textTheme.labelSmall,
                  ),
                  subtitle: Text(
                    name,
                    style: theme.textTheme.labelMedium!.copyWith(fontSize: 12),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

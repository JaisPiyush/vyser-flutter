import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vyser/models/index.dart';
import 'package:vyser/route_args.dart';
import 'package:vyser/widgets/nav_bar/nav_bar.dart';

class ItemDetail extends StatelessWidget {
  ItemDetail({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final Attributes attrs = Attributes.fromJson({
    "attributes": [
      {"key": "Shelf Life", "index": 0, "value": "2 Days"},
      {"key": "Packaging Type", "index": 1, "value": "Polypack"}
    ]
  });

  List<Widget> getWidgetsForAttributes(
      BuildContext context, ThemeData theme, Attributes attrs) {
    return attrs.attributes
        .map(
          (e) => Container(
            color: Colors.white,
            child: ListTile(
              title: Text(
                e['key'],
                style: theme.textTheme.labelMedium,
              ),
              subtitle: Text(
                e['value'],
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: Colors.grey[600]),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as ItemDetailArgument;
    final theme = Theme.of(context);
    final appLocalization = AppLocalizations.of(context)!;
    final image =
        'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/09/instagram-image-size.jpg';
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            appBar: NavBarWidget(context: context, title: ''),
            body: Container(
              color: Colors.grey[100],
              height: MediaQuery.of(context).size.height,
              child: ListView(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.network(
                      image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        'Amul',
                        style: theme.textTheme.labelSmall,
                      ),
                      subtitle: Text(
                        'Amul Gold Full Cream Fresh Milk 500 ml',
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        appLocalization.price,
                        style: theme.textTheme.labelSmall,
                      ),
                      subtitle: Text(
                        'Rs 33/ 500ml',
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        appLocalization.quantity,
                        style: theme.textTheme.labelSmall,
                      ),
                      subtitle: Text(
                        '100',
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        appLocalization.reorderLevel,
                        style: theme.textTheme.labelSmall,
                      ),
                      subtitle: Text(
                        '10',
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        'Description',
                        style: theme.textTheme.labelSmall,
                      ),
                      subtitle: Text(
                        'Amul Gold Full Cream Milk (Polypack) Milk is homogenized toned pasteurized milk. Rich and creamy, this milk is an excellent source of vitamin A and vitamin D that enhances growth and development of the body tissues and the brain.',
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  ...getWidgetsForAttributes(context, theme, attrs),
                  const SizedBox(
                    height: 200,
                  ),
                ],
              ),
            )));
  }
}

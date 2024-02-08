import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vyser/models/index.dart';
import 'package:vyser/pages/item_detail/bloc/item_detail_bloc.dart';
import 'package:vyser/pages/item_detail/bloc/item_detail_events.dart';
import 'package:vyser/pages/item_detail/bloc/item_detail_state.dart';
import 'package:vyser/route_args.dart';
import 'package:vyser/widgets/nav_bar/nav_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ItemDetail extends StatelessWidget {
  ItemDetail({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
    final args =
        ModalRoute.of(context)!.settings.arguments as ItemDetailArgument;
    final theme = Theme.of(context);
    final appLocalization = AppLocalizations.of(context)!;
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            appBar: NavBarWidget(context: context, title: ''),
            body: Container(
              color: Colors.grey[100],
              height: MediaQuery.of(context).size.height,
              child: BlocProvider(
                create: (_) =>
                    ItemDetailBloc(args)..add(FetchItemDetailEvent()),
                child: BlocBuilder<ItemDetailBloc, ItemDetailState>(
                    builder: (context, state) {
                  if (state is FetchedItemDetailFailedState) {
                    return const Center(
                      child: Text('Failed to fetch item'),
                    );
                  } else if (state is FetchedItemDetailState) {
                    return ListView(
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: CarouselSlider.builder(
                              itemCount: state.item.descriptor_images.length,
                              itemBuilder: (BuildContext context, int itemIndex,
                                      int pageViewIndex) =>
                                  Image.network(
                                    state.item.descriptor_images[itemIndex],
                                    fit: BoxFit.cover,
                                  ),
                              options: CarouselOptions(
                                height: 200,
                                aspectRatio: 16 / 9,
                                initialPage: 0,
                                scrollDirection: Axis.horizontal,
                              )),
                        ),
                        Container(
                          color: Colors.white,
                          child: ListTile(
                            title: Text(
                              state.item.creator,
                              style: theme.textTheme.labelSmall,
                            ),
                            subtitle: Text(
                              state.item.descriptor_name,
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
                              '${state.item.price_currency} ${state.item.price}/ ${state.item.unit}',
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
                              state.item.quantity.toString(),
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
                              state.item.reorder_level.toString(),
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
                              state.item.descriptor_long_desc ?? '',
                              style: theme.textTheme.labelMedium,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        ...getWidgetsForAttributes(
                            context, theme, state.item.attributes),
                        const SizedBox(
                          height: 200,
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ),
            )));
  }
}

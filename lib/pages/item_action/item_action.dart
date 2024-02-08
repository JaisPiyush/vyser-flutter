import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyser/models/index.dart';
import 'package:vyser/pages/item_action/bloc/item_action_bloc.dart';
import 'package:vyser/pages/item_action/bloc/item_action_events.dart';
import 'package:vyser/pages/item_action/bloc/item_action_state.dart';
import 'package:vyser/route_args.dart';
import 'package:vyser/shared/constants.dart';
import 'package:vyser/widgets/item_card/item_card.dart';
import 'package:vyser/widgets/nav_bar/nav_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ItemActionPage extends StatelessWidget {
  ItemActionPage({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments! as ItemActionArgument;
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    String getHeaderName() {
      switch (args.actionId) {
        case ActionId.AddItem:
          return appLocalizations.addItems;
        case ActionId.EditItem:
          return appLocalizations.editItems;
        default:
          return appLocalizations.search;
      }
    }

    final itemActionBloc = ItemActionBloc(args);
    itemActionBloc.add(SearchProductEvent());

    void navigateToEditOrAddItem() {
      var items = itemActionBloc.selectedResultsMap.values.toList();
      if (items.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Select items',
            ),
          ),
        );
        return;
      }
      Navigator.pushNamed(context, RouteNames.EditOrAddItem,
          arguments: EditOrItemsArgument(
              actionId: args.actionId, payload: args.payload, items: items));
    }

    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      appBar: NavBarWidget(
        context: context,
        title: getHeaderName(),
      ),
      body: Center(
        child: BlocProvider(
          create: (_) => itemActionBloc,
          child: BlocBuilder<ItemActionBloc, ItemActionState>(
            bloc: itemActionBloc,
            builder: (context, state) {
              if (state is SearchProductFailedState) {
                return Text('Search Failed');
              } else if (state is ShowVisionSearchResponseState) {
                return Column(
                  children: [
                    Expanded(
                        child: GridView.builder(
                            itemCount: state.response.products.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  itemActionBloc.add(
                                      ShowSelectedResultsForIdentifiedProductEvent(
                                          state.response.products[index],
                                          index.toString()));
                                },
                                child: Card(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.network(
                                        state.response.image,
                                        fit: BoxFit.fill,
                                      ),
                                      (itemActionBloc
                                              .itemSelectedForIdentifiedProduct(
                                                  index.toString()))
                                          ? const Icon(Icons.check_circle,
                                              color: Color.fromARGB(
                                                  255, 18, 244, 25),
                                              size: 50)
                                          : const SizedBox()
                                    ],
                                  ),
                                ),
                              );
                            })),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (args.actionId == ActionId.SearchItems) {
                              } else {
                                navigateToEditOrAddItem();
                              }
                            },
                            child: Text(
                              appLocalizations.continueBtn,
                              style: theme.textTheme.labelMedium!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ))
                  ],
                );
              } else if (state
                  is ShowSelectedResultsForIdentifiedProductState) {
                return Column(
                  children: [
                    Expanded(
                        child: GridView.builder(
                            itemCount: state.results.results.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              VisionSearchSingleResult result =
                                  state.results.results[index];
                              return ItemCard(
                                image: result.image,
                                creator: '',
                                name: result.name,
                                onTap: () {
                                  if (args.actionId != ActionId.SearchItems) {
                                    itemActionBloc
                                        .selectedResultsMap[state.ref] = result;
                                    itemActionBloc.add(SearchProductEvent());
                                  } else {
                                    Navigator.pushNamed(
                                        context, RouteNames.ItemDetail,
                                        arguments: ItemDetailArgument(
                                            itemId: result.item_id!));
                                  }
                                },
                              );
                            }))
                  ],
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    ));
  }
}

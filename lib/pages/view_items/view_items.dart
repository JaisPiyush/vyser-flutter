import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyser/models/index.dart';
import 'package:vyser/pages/view_items/bloc/view_items_bloc.dart';
import 'package:vyser/pages/view_items/bloc/view_items_events.dart';
import 'package:vyser/pages/view_items/bloc/view_items_state.dart';
import 'package:vyser/route_args.dart';
import 'package:vyser/widgets/item_card/item_card.dart';
import 'package:vyser/widgets/nav_bar/nav_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewItems extends StatefulWidget {
  @override
  State<ViewItems> createState() => _ViewItemsState();
}

class _ViewItemsState extends State<ViewItems> {
  late TextEditingController _searchController;
  late ViewItemsBloc viewItemsBloc;

  @override
  void initState() {
    super.initState();
    viewItemsBloc = ViewItemsBloc();

    _searchController = TextEditingController();

    _searchController.addListener(listenSearchInput);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    viewItemsBloc.close();
  }

  void listenSearchInput() {
    viewItemsBloc.add(SearchItem(_searchController.text));
  }

  void navigateToItemDetails(Item item) {
    // TODO: You have to add item Details page and then add this navigation
    // Navigator.pushNamed(context, '/item_details', arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final args =
        ModalRoute.of(context)!.settings.arguments as ItemActionArgument?;
    if (args != null) {
      if (args.payload != null && args.payload!.name != null) {
        _searchController.text = args.payload!.name!;
        viewItemsBloc.add(SearchItem(args.payload!.name!));
      }
    } else {
      viewItemsBloc.add(FetchItems());
    }

    final appLocalization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: NavBarWidget(
        context: context,
        title: '',
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
                controller: _searchController,
                decoration: InputDecoration(
                    border: theme.inputDecorationTheme.border!.copyWith(
                        borderSide: const BorderSide(color: Colors.grey)),
                    filled: theme.inputDecorationTheme.filled,
                    iconColor: theme.inputDecorationTheme.iconColor,
                    focusedBorder: theme.inputDecorationTheme.focusedBorder,
                    hintText: appLocalization.search,
                    prefixIcon: const Icon(Icons.search)),
              ),
            ),
            const Divider(),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: BlocProvider(
                    create: (_) => viewItemsBloc,
                    child: BlocBuilder<ViewItemsBloc, ViewItemState>(
                      builder: (context, state) {
                        if (state is ViewItemFetchedItems) {
                          return GridView.builder(
                              itemCount: state.items.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                Item item = state.items[index];
                                return ItemCard(
                                  key: Key(item.id),
                                  onTap: () {
                                    navigateToItemDetails(item);
                                  },
                                  image: item.descriptor_images[0],
                                  name: item.name,
                                  creator: item.creator,
                                );
                              });
                        } else if (state is ViewItemsFetchingFailed) {
                          return const Center(
                            child: Text('Failed to fetch items'),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyser/models/index.dart';
import 'package:vyser/pages/edit_or_add_item/bloc/edit_or_add_item_bloc.dart';
import 'package:vyser/pages/edit_or_add_item/bloc/edit_or_add_item_event.dart';
import 'package:vyser/pages/edit_or_add_item/bloc/edit_or_add_item_state.dart';
import 'package:vyser/pages/edit_or_add_item/edit_or_add_item_model.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vyser/route_args.dart';
import 'package:vyser/shared/constants.dart';
import 'package:vyser/widgets/item_form.dart';
import 'package:vyser/widgets/nav_bar/nav_bar.dart';

class EditOrAddItemPage extends StatefulWidget {
  const EditOrAddItemPage({super.key});

  @override
  State<EditOrAddItemPage> createState() => _EditOrAddItemPageState();
}

class _EditOrAddItemPageState extends EditOrAddItemModel<EditOrAddItemPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments! as EditOrItemsArgument;

    final ids = args.items.map((e) {
      if (args.actionId == ActionId.AddItem) {
        return e.productReference;
      }
      return e.item_id!;
    }).toList();

    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      appBar: NavBarWidget(context: context, title: 'Add Item'),
      body: Center(
          child: BlocProvider(
        create: (_) => EditOrAddItemBloc(args)
          ..add(FetchEditableItemsEditOrAddItemEvent(ids)),
        child: BlocBuilder<EditOrAddItemBloc, EditOrAddItemState>(
          builder: (context, state) {
            if (state is FetchingEditableItemsFailedEditOrAddItemState) {
              return const Text('Failed to fetch items');
            } else if (state is FetchedEditableItemsEditOrAddItemState) {
              // if (state is EditableItemWorkingFailedEditOrAddItemState) {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(
              //       content: Text('The provided phone number is not valid.'),
              //     ),
              //   );
              // }
              return ItemFormAccordians(items: state.items);
            } else if (state is EditableItemWorkingSuccessEditOrAddItemState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.popUntil(context,
                    (route) => route.settings.name == RouteNames.HomePage);
              });
            } else if (state is EditableItemWorkingFailedEditOrAddItemState) {
              return const Text('Failed');
            }
            return const CircularProgressIndicator();
          },
        ),
      )),
    ));
  }
}

class ItemFormAccordians extends StatefulWidget {
  const ItemFormAccordians({
    super.key,
    required this.items,
    // required this.actionId,
  });

  final List<EditableItem> items;
  // final String actionId;

  @override
  State<ItemFormAccordians> createState() => _ItemFormAccordiansState();
}

class _ItemFormAccordiansState extends State<ItemFormAccordians> {
  int currentFocusIndex = 0;

  late List<EditableItem> saveAbleEditableItems;

  @override
  void initState() {
    super.initState();
    saveAbleEditableItems = widget.items;
  }

  void saveEditableItems(BuildContext context) {
    final editOrAdditemBloc = BlocProvider.of<EditOrAddItemBloc>(context);
    editOrAdditemBloc
        .add(SaveEditableItemsEditOrAddItemEvent(saveAbleEditableItems));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    void updateEditableItems(int index, EditableItem item) {
      setState(() {
        saveAbleEditableItems[index] = item;
        if (index == widget.items.length - 1) {
          saveEditableItems(context);
        }
      });
    }

    List<AccordionSection> getSections() {
      List<AccordionSection> sections = [];
      for (int i = 0; i < saveAbleEditableItems.length; i++) {
        EditableItem item = saveAbleEditableItems[i];
        sections.add(AccordionSection(
            isOpen: i == currentFocusIndex,
            header: Text(
              item.name!,
              style: theme.textTheme.labelMedium,
            ),
            content:
                ItemForm(index: i, item: item, onSubmit: updateEditableItems)));
      }
      return sections;
    }

    return Accordion(
      headerBackgroundColor: theme.colorScheme.primaryContainer,
      headerPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      scaleWhenAnimating: false,
      contentBackgroundColor: theme.colorScheme.primaryContainer,
      contentBorderWidth: 0,
      rightIcon: const Icon(Icons.arrow_drop_down, color: Colors.black),
      children: getSections(),
    );
  }
}

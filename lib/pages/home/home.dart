import 'package:flutter/material.dart';
import 'package:vyser/widgets/nav_bar/nav_bar.dart';
import 'package:vyser/pages/home/bloc/home_bloc.dart';
import 'package:vyser/pages/home/bloc/home_events.dart';
import 'package:vyser/pages/home/bloc/home_state.dart';
import 'package:vyser/pages/home/home_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomePageModel<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLocalization = AppLocalizations.of(context)!;
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeBloc()..add(FetchSeller()),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              key: _scaffoldKey,
              appBar: state is! SellerFetched
                  ? null
                  : NavBarWidget(
                      context: context,
                      title: appLocalization.home,
                      showLeadingIcon: false,
                      actions: [
                        Switch(
                            value: state.seller.is_store_active,
                            activeTrackColor: Colors.green,
                            onChanged: (active) {})
                      ],
                      bottom: TabBar(tabs: [
                        Text(
                          appLocalization.chatbot,
                          style: theme.textTheme.labelLarge!
                              .copyWith(color: theme.colorScheme.background),
                        ),
                        Text(
                          appLocalization.orders,
                          style: theme.textTheme.labelLarge!
                              .copyWith(color: theme.colorScheme.background),
                        ),
                      ]),
                    ),
              body: Container(
                child: state is! SellerFetched
                    ? const Center(child: CircularProgressIndicator())
                    : TabBarView(children: [
                        Center(
                          child: Text(appLocalization.chatbot),
                        ),
                        Center(child: Text(appLocalization.orders)),
                      ]),
              ),
            ),
          );
        }),
      ),
    );
  }
}

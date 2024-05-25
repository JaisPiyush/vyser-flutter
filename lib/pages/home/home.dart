import 'package:flutter/material.dart';
import 'package:vyser/route_args.dart';
import 'package:vyser/views/messages/bloc/messages_events.dart';
import 'package:vyser/views/messages/bloc/messags_bloc.dart';
import 'package:vyser/views/messages/message_view.dart';
import 'package:vyser/widgets/nav_bar/nav_bar.dart';
import 'package:vyser/pages/home/bloc/home_bloc.dart';
import 'package:vyser/pages/home/bloc/home_events.dart';
import 'package:vyser/pages/home/bloc/home_state.dart';
import 'package:vyser/pages/home/home_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyser/widgets/order_card.dart';

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
    var messageBloc = MessagesBloc();

    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeBloc()..add(FetchSeller()),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.receipt), label: 'Sale Voucher')
              ],
              onTap: (index) {
                if (index == 1) {
                  Navigator.of(context).pushNamed(RouteNames.SaleVoucher);
                }
              },
            ),
            appBar: state is! SellerFetched
                ? null
                : NavBarWidget(
                    context: context,
                    title: appLocalization.shop,
                    showLeadingIcon: false,
                    bottom: TabBar(controller: tabController, tabs: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          appLocalization.chatbot,
                          style: theme.textTheme.labelLarge!
                              .copyWith(color: theme.colorScheme.primary),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          appLocalization.orders,
                          style: theme.textTheme.labelLarge!
                              .copyWith(color: theme.colorScheme.primary),
                        ),
                      ),
                    ]),
                  ),
            body: Container(
              child: state is! SellerFetched
                  ? const Center(child: CircularProgressIndicator())
                  : TabBarView(controller: tabController, children: [
                      Builder(builder: (context) {
                        if (messageBloc.isClosed) {
                          messageBloc = MessagesBloc();
                        }
                        return Center(
                          child: Column(
                            children: [
                              Expanded(
                                  child: BlocProvider(
                                create: (_) =>
                                    messageBloc..add(FetchMessagesEvent()),
                                child: const MessagesView(),
                              )),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 80,
                                color: Colors.grey[900],
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          // final messageBloc =
                                          //     BlocProvider.of<MessagesBloc>(
                                          //         context);
                                          pickImageAndSendMessage(messageBloc);
                                        },
                                        icon: const Icon(Icons.camera_alt,
                                            color: Colors.white)),
                                    Expanded(
                                      child: TextField(
                                          controller: messageTextController,
                                          cursorColor: Colors.white,
                                          decoration: InputDecoration(
                                              fillColor: Colors.grey[700],
                                              hintText: appLocalization.type,
                                              hintStyle: theme
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                      color: Colors.white)),
                                          style: theme.textTheme.bodyMedium!
                                              .copyWith(color: Colors.white)),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          // final messageBloc =
                                          //     BlocProvider.of<MessagesBloc>(
                                          //         context);
                                          sendTextMessage(messageBloc);
                                        },
                                        icon: const Icon(Icons.send,
                                            color: Colors.green))
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                      Center(
                          child: ListView(
                        children: const [
                          OrderTab(),
                        ],
                      )),
                    ]),
            ),
          );
        }),
      ),
    );
  }
}

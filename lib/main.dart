import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vyser/app.state.dart';
import 'package:vyser/config/theme.dart';
import 'package:vyser/firebase_options.dart';
import 'package:vyser/pages/auth/sign_in.dart';
import 'package:vyser/pages/auth/sign_in_model.dart';
import 'package:vyser/pages/home/home_model.dart';
import 'package:vyser/pages/home/home.dart';
import 'package:vyser/pages/language_selector/langauge_selector.dart';
import 'package:vyser/pages/view_items/view_items.dart';
import 'package:vyser/shared/api_call.dart';
import 'package:vyser/shared/custom_actions.dart';

final getIt = GetIt.instance;
void main() async {
  // GetIt registrations
  getIt.registerSingleton<CustomActions>(CustomActions());
  getIt.registerSingleton<APICallGroup>(
      APICallGroup('https://03b3-192-140-153-91.ngrok-free.app'));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: Consumer<AppState>(builder: (context, appState, child) {
        return MaterialApp(
            title: 'Vyser',
            theme: themeData,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routes: {
              SignInModel.routeName: (context) => const SignInPage(),
              HomePageModel.routeName: (context) => const HomePage(),
            },
            locale: appState.locale,
            home: const MyHomePage());
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    final appState = Provider.of<AppState>(context, listen: false);
    appState.isAuthenticated = FirebaseAuth.instance.currentUser != null;
    FirebaseAuth.instance.authStateChanges().listen((user) {
      appState.setIsAuthenticated(user != null);
    });
    // appState.setIsAuthenticated(FirebaseAuth.instance.currentUser != null);
  }

  @override
  void dispose() {
    FirebaseAuth.instance.authStateChanges().listen((user) {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    if (appState.isAuthenticated) {
      return ViewItems();
    }
    return LanguageSelectorPage();
  }
}

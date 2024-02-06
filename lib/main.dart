import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vyser/firebase_options.dart';
import 'package:vyser/page/auth/sign_in.dart';
import 'package:vyser/page/auth/sign_in_model.dart';
import 'package:vyser/page/home/home_model.dart';
import 'package:vyser/page/home/home.dart';
import 'package:vyser/shared/custom_actions.dart';

final getIt = GetIt.instance;
void main() async {
  getIt.registerSingleton<CustomActions>(CustomActions());
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
    return MaterialApp(
        title: 'Vyser',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size.fromHeight(50))),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey[600]!)),
            filled: true,
            iconColor: Colors.red,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black, width: 2)),
          ),
          textTheme: TextTheme(
            titleLarge: GoogleFonts.getFont('Outfit',
                fontWeight: FontWeight.w500,
                fontSize: 22.0,
                color: Colors.black),
            titleMedium: GoogleFonts.getFont('Readex Pro',
                fontWeight: FontWeight.normal,
                fontSize: 18.0,
                color: Colors.black),
            titleSmall: GoogleFonts.getFont('Readex Pro',
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                color: Colors.black),
            labelLarge: GoogleFonts.getFont('Readex Pro',
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
                color: Colors.black),
            labelMedium: GoogleFonts.getFont('Readex Pro',
                fontWeight: FontWeight.normal,
                fontSize: 14.0,
                color: Colors.black),
            labelSmall: GoogleFonts.getFont(
              'Readex Pro',
              fontWeight: FontWeight.normal,
              fontSize: 12.0,
              color: Colors.grey[600],
            ),
            bodyLarge: GoogleFonts.getFont('Readex Pro',
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
                color: Colors.black),
            bodyMedium: GoogleFonts.getFont('Readex Pro',
                fontWeight: FontWeight.normal,
                fontSize: 14.0,
                color: Colors.black),
            bodySmall: GoogleFonts.getFont(
              'Readex Pro',
              fontWeight: FontWeight.normal,
              fontSize: 12.0,
              color: Colors.grey[600],
            ),
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routes: {
          SignInModel.routeName: (context) => const SignInPage(),
          HomePageModel.routeName: (context) => const HomePage(),
        },
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const SignInPage();
  }
}

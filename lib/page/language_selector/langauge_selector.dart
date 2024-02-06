import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vyser/app.state.dart';
import 'package:vyser/components/nav_bar/nav_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vyser/page/auth/sign_in_model.dart';

class Language {
  final String name;
  final String image;
  final Locale locale;

  const Language({
    required this.name,
    required this.image,
    required this.locale,
  });
}

class LanguageSelectorPage extends StatelessWidget {
  LanguageSelectorPage({super.key});

  final List<Language> langs = const [
    Language(
        name: 'English',
        image: 'https://cdn-icons-png.flaticon.com/512/555/555526.png',
        locale: Locale('en')),
    Language(
        name: 'हिंदी',
        image:
            'https://static-00.iconduck.com/assets.00/letter-hindi-a-icon-508x512-9ekygi2z.png',
        locale: Locale('hi')),
    Language(
      image:
          'https://creazilla-store.fra1.digitaloceanspaces.com/icons/7901399/gujarati-vowel-a-icon-md.png',
      locale: Locale('gu'),
      name: 'ગુજરાતી',
    ),
    Language(
        name: 'ಕನ್ನಡ',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Kannada.svg/1280px-Kannada.svg.png',
        locale: Locale('kn'))
  ];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context)!;
    final appState = Provider.of<AppState>(context);

    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      appBar: NavBarWidget(
        context: context,
        title: appLocalization.selectLanguage,
        showLeadingIcon: FirebaseAuth.instance.currentUser != null,
      ),
      body: Center(
        child: ListView.builder(
            itemCount: langs.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(langs[index].image),
                    title: Text(langs[index].name),
                    contentPadding: const EdgeInsets.all(8),
                    onTap: () {
                      appState.setLocale(langs[index].locale);
                      if (FirebaseAuth.instance.currentUser != null) {
                        Navigator.pop(context);
                      } else {
                        Navigator.of(context).pushNamed(
                          SignInModel.routeName,
                        );
                      }
                    },
                  ),
                ),
              );
            }),
      ),
    ));
  }
}

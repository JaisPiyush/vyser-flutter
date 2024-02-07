import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vyser/pages/auth/sign_in_model.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends SignInModel<SignInPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        key: _scaffoldKey,
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Vyser',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 36),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 22),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                currentScreenIndex == 0
                                    ? AppLocalizations.of(context)!.getStarted
                                    : AppLocalizations.of(context)!.verify,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: 34),
                              ),
                              Text(
                                currentScreenIndex == 0
                                    ? AppLocalizations.of(context)!
                                        .singInMessage
                                    : AppLocalizations.of(context)!
                                        .smsSent(phoneNumberController.text),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(fontSize: 16),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                controller: currentScreenIndex == 0
                                    ? phoneNumberController
                                    : smsController,
                                autofocus: true,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  labelText: currentScreenIndex == 0
                                      ? AppLocalizations.of(context)!
                                          .phoneNumber
                                      : AppLocalizations.of(context)!.smsHint,
                                  hintText: currentScreenIndex == 0
                                      ? '+91 xxx xxx xxx x'
                                      : AppLocalizations.of(context)!.smsHint,
                                  border: theme.inputDecorationTheme.border,
                                  filled: theme.inputDecorationTheme.filled,
                                  focusedBorder:
                                      theme.inputDecorationTheme.focusedBorder,
                                  iconColor:
                                      theme.inputDecorationTheme.iconColor,
                                  prefixIcon: currentScreenIndex == 0
                                      ? const Icon(Icons.phone)
                                      : null,
                                ),
                              ),
                              currentScreenIndex == 0
                                  ? const SizedBox(height: 1)
                                  : TextButton(
                                      onPressed: () {
                                        if (allowResendButtonClick) {
                                          sendSmsCodeToPhoneNumber(context,
                                              phoneNumberController.text);
                                        }
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)!.resend,
                                      ),
                                    ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  if (currentScreenIndex == 0) {
                                    signInWithPhoneNumber(context);
                                  } else {
                                    verifySmsCode(context);
                                  }
                                },
                                style: theme.elevatedButtonTheme.style,
                                child: showLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        AppLocalizations.of(context)!
                                            .continueBtn,
                                        style: theme.textTheme.labelLarge!
                                            .copyWith(color: Colors.white),
                                      ),
                              )
                            ]),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

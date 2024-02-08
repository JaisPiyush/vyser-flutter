import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vyser/route_args.dart';

class SignInModel<T extends StatefulWidget> extends State<T> {
  late TextEditingController phoneNumberController;
  late TextEditingController smsController;

  late FocusNode phoneNumberFocusNode;
  late FocusNode smsFocusNode;
  late FirebaseAuth auth;

  int currentScreenIndex = 0;
  bool allowResendButtonClick = false;
  String? verificationId;
  int? resendToken;

  bool showLoading = false;

  @override
  void initState() {
    super.initState();
    phoneNumberController = TextEditingController();
    smsController = TextEditingController();
    phoneNumberFocusNode = FocusNode();
    smsFocusNode = FocusNode();
    resendToken = null;
    verificationId = null;
    allowResendButtonClick = false;
    currentScreenIndex = 0;
    showLoading = false;
    auth = FirebaseAuth.instance;
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    smsController.dispose();
    phoneNumberFocusNode.dispose();
    smsFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  Future<void> sendSmsCodeToPhoneNumber(
      BuildContext context, String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      forceResendingToken: resendToken,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The provided phone number is not valid.'),
            ),
          );
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          showLoading = false;
          this.verificationId = verificationId;
          this.resendToken = resendToken;
          currentScreenIndex = 1;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          allowResendButtonClick = true;
        });
      },
    );
    if (!context.mounted) return Future.value();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          AppLocalizations.of(context)!.smsSent(phoneNumber),
        ),
      ),
    );
  }

  bool validatePhoneNumber() {
    return phoneNumberController.text.isNotEmpty &&
        (phoneNumberController.text.length == 10 ||
            phoneNumberController.text.length == 13);
  }

  Future<void> signInWithPhoneNumber(BuildContext context) async {
    setState(() {
      showLoading = true;
    });
    if (!validatePhoneNumber()) {
      if (!context.mounted) return Future.value();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid phone number.'),
        ),
      );
      return Future.value();
    }
    String phoneNumber = phoneNumberController.text.trim();
    if (!phoneNumber.contains('+91')) {
      phoneNumber = '+91$phoneNumber';
    }
    await sendSmsCodeToPhoneNumber(context, phoneNumber);
  }

  Future<void> verifySmsCode(BuildContext context) async {
    setState(() {
      showLoading = true;
    });
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: smsController.text,
    );
    await auth.signInWithCredential(credential);
    setState(() {
      showLoading = false;
    });
    if (!context.mounted) return;
    Navigator.of(context).pushReplacementNamed(
      RouteNames.HomePage,
    );
  }
}

import 'package:flutter/material.dart';

class NavBarWidget extends AppBar {
  NavBarWidget({
    super.key,
    required BuildContext context,
    required String title,
    bool showLeadingIcon = true,
    IconData leadingIcon = Icons.arrow_back,
    VoidCallback? leadingAction,
  }) : super(
          leading: !showLeadingIcon
              ? null
              : IconButton(
                  onPressed: () {
                    if (leadingAction != null) {
                      leadingAction();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  icon: Icon(
                    leadingIcon,
                    color: Theme.of(context).colorScheme.background,
                  )),
          title: Text(title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.background,
                  )),
          backgroundColor: Theme.of(context).colorScheme.primary,
        );
}

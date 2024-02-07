import 'package:flutter/material.dart';

class NavBarWidget extends AppBar {
  NavBarWidget({
    super.key,
    required BuildContext context,
    required String title,
    bool showLeadingIcon = true,
    IconData leadingIcon = Icons.arrow_back,
    VoidCallback? leadingAction,
    super.automaticallyImplyLeading = true,
    super.actions,
    super.flexibleSpace,
    super.bottom,
    super.elevation,
    super.scrolledUnderElevation,
    super.notificationPredicate = defaultScrollNotificationPredicate,
    super.shadowColor,
    super.surfaceTintColor,
    super.shape,
    super.foregroundColor,
    super.iconTheme,
    super.actionsIconTheme,
    super.primary = true,
    super.centerTitle,
    super.excludeHeaderSemantics = false,
    super.titleSpacing,
    super.toolbarOpacity = 1.0,
    super.bottomOpacity = 1.0,
    super.toolbarHeight,
    super.leadingWidth,
    super.toolbarTextStyle,
    super.titleTextStyle,
    super.systemOverlayStyle,
    super.forceMaterialTransparency = false,
    super.clipBehavior,
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

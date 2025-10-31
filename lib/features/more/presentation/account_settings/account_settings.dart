import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/features/more/more.dart';
import 'package:app/shared/shared.dart';

export 'account_settings_mobile.dart';
export 'account_settings_web.dart';

class AccountSettingsScreen extends ConsumerWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ResponsiveWidget(
        smallScreen: AccountSettingsScreenMobile(),
        largeScreen: AccountSettingsScreenWeb(),
      ),
    );
  }
}

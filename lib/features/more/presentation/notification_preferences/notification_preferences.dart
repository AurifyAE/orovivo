import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/features/more/more.dart';
import 'package:app/shared/shared.dart';

export 'notification_preferences_mobile.dart';
export 'notification_preferences_web.dart';

class NotificationPreferencesScreen extends ConsumerWidget {
  const NotificationPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ResponsiveWidget(
        smallScreen: NotificationPreferencesScreenMobile(),
        largeScreen: NotificationPreferencesScreenWeb(),
      ),
    );
  }
}

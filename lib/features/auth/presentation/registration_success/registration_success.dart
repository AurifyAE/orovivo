import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/features/auth/auth.dart';
import 'package:app/shared/shared.dart';

export 'registration_success_mobile.dart';
export 'registration_success_web.dart';

class RegistrationSuccessScreen extends ConsumerWidget {
  const RegistrationSuccessScreen({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ResponsiveWidget(
        smallScreen: RegistrationSuccessScreenMobile(
          title: title,
          subTitle: subtitle,
        ),
        largeScreen: const RegistrationSuccessScreenWeb(),
      ),
    );
  }
}

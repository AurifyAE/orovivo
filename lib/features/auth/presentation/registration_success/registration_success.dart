import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/features/auth/auth.dart';
import 'package:app/shared/shared.dart';

export 'registration_success_mobile.dart';
export 'registration_success_web.dart';

class RegistrationSuccessScreen extends ConsumerWidget {
  const RegistrationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ResponsiveWidget(
        smallScreen: RegistrationSuccessScreenMobile(),
        largeScreen: RegistrationSuccessScreenWeb(),
      ),
    );
  }
}

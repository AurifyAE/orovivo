import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/features/auth/auth.dart';
import 'package:app/shared/shared.dart';

export 'registration_mobile.dart';
export 'registration_web.dart';

class RegistrationScreen extends ConsumerWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ResponsiveWidget(
        smallScreen: RegistrationScreenMobile(),
        largeScreen: RegistrationScreenWeb(),
      ),
    );
  }
}

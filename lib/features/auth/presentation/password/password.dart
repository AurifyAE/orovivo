import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/features/auth/auth.dart';
import 'package:app/shared/shared.dart';

export 'password_mobile.dart';
export 'password_web.dart';

class PasswordScreen extends ConsumerWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ResponsiveWidget(
        smallScreen: PasswordScreenMobile(),
        largeScreen: PasswordScreenWeb(),
      ),
    );
  }
}

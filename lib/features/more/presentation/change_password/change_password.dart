import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/features/more/more.dart';
import 'package:app/shared/shared.dart';

export 'change_password_mobile.dart';
export 'change_password_web.dart';

class ChangePasswordScreen extends ConsumerWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ResponsiveWidget(
        smallScreen: ChangePasswordScreenMobile(),
        largeScreen: ChangePasswordScreenWeb(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/features/more/more.dart';
import 'package:app/shared/shared.dart';

export 'help_and_support_mobile.dart';
export 'help_and_support_web.dart';

class HelpAndSupportScreen extends ConsumerWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ResponsiveWidget(
        smallScreen: HelpAndSupportScreenMobile(),
        largeScreen: HelpAndSupportScreenWeb(),
      ),
    );
  }
}

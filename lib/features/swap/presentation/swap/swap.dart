import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/features/swap/swap.dart';
import 'package:app/shared/shared.dart';

export 'swap_mobile.dart';
export 'swap_web.dart';

class SwapScreen extends ConsumerWidget {
  const SwapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ResponsiveWidget(
        smallScreen: SwapScreenMobile(),
        largeScreen: SwapScreenWeb(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/features/branch/branch.dart';
import 'package:app/shared/shared.dart';

export 'branch_mobile.dart';
export 'branch_web.dart';

class BranchScreen extends ConsumerWidget {
  const BranchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ResponsiveWidget(
        smallScreen: BranchScreenMobile(),
        largeScreen: BranchScreenWeb(),
      ),
    );
  }
}

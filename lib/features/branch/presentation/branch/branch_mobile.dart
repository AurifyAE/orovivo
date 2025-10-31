import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod_theme/colors.dart';

class BranchScreenMobile extends ConsumerStatefulWidget {
  const BranchScreenMobile({super.key});

  @override
  ConsumerState<BranchScreenMobile> createState() =>
      _BranchScreenMobileState();
}

class _BranchScreenMobileState extends ConsumerState<BranchScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: Center(
        child: Text('Branch'),
      ),
      );
  }
}
 
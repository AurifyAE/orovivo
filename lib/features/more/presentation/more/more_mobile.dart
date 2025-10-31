import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod_theme/colors.dart';

class MoreScreenMobile extends ConsumerStatefulWidget {
  const MoreScreenMobile({super.key});

  @override
  ConsumerState<MoreScreenMobile> createState() =>
      _MoreScreenMobileState();
}

class _MoreScreenMobileState extends ConsumerState<MoreScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: Center(
        child: Text('More'), 
      ),
    );
  }
}

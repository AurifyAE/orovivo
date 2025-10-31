import 'package:app/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod_theme/colors.dart';
import 'package:hancod_theme/text.dart';

class MoreScreenMobile extends ConsumerStatefulWidget {
  const MoreScreenMobile({super.key});

  @override
  ConsumerState<MoreScreenMobile> createState() =>
      _MoreScreenMobileState();
}

class _MoreScreenMobileState extends ConsumerState<MoreScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'More', 
          style: AppText.xLargeSB.copyWith(
            color: AppColors.white,
          ),
        ),
        centerTitle: false, 
        leadingWidth: 10,
      ),
      body: Center(
        child: Text('More'), 
      ),
    );
  }
}

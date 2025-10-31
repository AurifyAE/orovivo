import 'package:app/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod_theme/colors.dart';
import 'package:hancod_theme/text.dart';

class SwapScreenMobile extends ConsumerStatefulWidget {
  const SwapScreenMobile({super.key});

  @override
  ConsumerState<SwapScreenMobile> createState() =>
      _SwapScreenMobileState();
}

class _SwapScreenMobileState extends ConsumerState<SwapScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Branch Gold Transfer', 
          style: AppText.xLargeSB.copyWith( 
            color: AppColors.white,
          ),
        ),
        centerTitle: false,
        actions: [
          TextButton(onPressed: (){}, child: Text('Cancel'))
        ],

        // leadingWidth: 50,
      ),
      body: Center(
        child: Text('Swap'), 
      ),
    );
  }
}

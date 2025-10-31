import 'package:app/shared/utils/assets.gen.dart';
import 'package:app/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod_theme/colors.dart';
import 'package:hancod_theme/text.dart';

class BranchScreenMobile extends ConsumerStatefulWidget {
  const BranchScreenMobile({super.key});

  @override
  ConsumerState<BranchScreenMobile> createState() =>
      _BranchScreenMobileState();
}

class _BranchScreenMobileState extends ConsumerState<BranchScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar( 
        title: Text(
          'Branch',
          style: AppText.xLargeSB.copyWith(
            color: AppColors.white,
          ),
        ),
        centerTitle: false,
        leadingWidth: 10,
        actions: [
          TextButton.icon(
            
            // splashColor: Colors.transparent,
  onPressed: () {},
  icon: Assets.icons.forwardArrow.svg(), 
  label: Text("Swap", style: AppText.mediumM.copyWith(
    color: AppColors.white,
  )),
  style: TextButton.styleFrom(
    splashFactory: NoSplash.splashFactory,
    overlayColor: Colors.transparent, 
    textStyle: TextStyle(fontSize: 16), 
  ), 
  // This flips icon and text order
  iconAlignment: IconAlignment.end, // ✅ Flutter 3.10+ supports this
)

        ],
      ),
      body: Center(
        child: Text('Branch'),
      ),
      );
  }
}
 
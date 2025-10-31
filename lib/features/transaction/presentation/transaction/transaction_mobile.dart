import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod_theme/colors.dart';

class TransactionScreenMobile extends ConsumerStatefulWidget {
  const TransactionScreenMobile({super.key});

  @override
  ConsumerState<TransactionScreenMobile> createState() =>
      _TransactionScreenMobileState();
}

class _TransactionScreenMobileState extends ConsumerState<TransactionScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldBgColor, 
      body: Center(
        child: Text('Transaction'),
      ),
    );
  }
}

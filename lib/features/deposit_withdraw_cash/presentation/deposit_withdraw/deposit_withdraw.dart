import 'package:app/features/deposit_withdraw_cash/deposit_withdraw_cash.dart';
import 'package:app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'deposit_withdraw_mobile.dart';
export 'deposit_withdraw_web.dart';

class DepositWithdrawScreen extends ConsumerWidget {
  const DepositWithdrawScreen({
    required this.transferType,
    super.key,
    this.currentBalance = 5200.00,
  });

  final TransferType transferType;
  final double currentBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ResponsiveWidget(
        smallScreen: DepositWithdrawScreenMobile(
          transferType: transferType,
          currentBalance: currentBalance,
        ),
        largeScreen: DepositWithdrawScreenWeb(
          transferType: transferType,
          currentBalance: currentBalance,
        ),
      ),
    );
  }
}

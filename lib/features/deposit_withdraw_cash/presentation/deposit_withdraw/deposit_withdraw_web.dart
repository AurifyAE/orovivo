import 'package:app/features/deposit_withdraw_cash/deposit_withdraw_cash.dart';
import 'package:app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DepositWithdrawScreenWeb extends ConsumerStatefulWidget {
  const DepositWithdrawScreenWeb({
    required this.transferType,
    super.key,
    this.currentBalance = 5200.00,
  });

  final TransferType transferType;
  final double currentBalance;

  @override
  ConsumerState<DepositWithdrawScreenWeb> createState() =>
      _DepositWithdrawScreenWebState();
}

class _DepositWithdrawScreenWebState
    extends ConsumerState<DepositWithdrawScreenWeb> {
  @override
  Widget build(BuildContext context) {
    // Web version can be implemented similarly to mobile
    // For now, just use the mobile version
    return DepositWithdrawScreenMobile(
      transferType: widget.transferType,
      currentBalance: widget.currentBalance,
    );
  }
}

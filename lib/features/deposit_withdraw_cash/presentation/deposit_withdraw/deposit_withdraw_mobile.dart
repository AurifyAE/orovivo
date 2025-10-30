import 'package:app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod_theme/hancod_theme.dart';
import 'package:intl/intl.dart';

class DepositWithdrawScreenMobile extends ConsumerStatefulWidget {
  const DepositWithdrawScreenMobile({
    required this.transferType,
    super.key,
    this.currentBalance = 5200.00,
  });

  final TransferType transferType;
  final double currentBalance;

  @override
  ConsumerState<DepositWithdrawScreenMobile> createState() =>
      _DepositWithdrawScreenMobileState();
}

class _DepositWithdrawScreenMobileState
    extends ConsumerState<DepositWithdrawScreenMobile> {
  void _handleValueChanged(String value) {}

  void _handleSubmit(String value) {
    if (value.isNotEmpty) {
      final amount = double.tryParse(value) ?? 0;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.transferType == TransferType.deposit
                ? 'Deposit request for \$$amount submitted'
                : 'Withdraw request for \$$amount submitted',
          ),
          backgroundColor: AppColors.brandGold,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat.currency(
      symbol: r'$',
    );
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(
        title: Text(
          widget.transferType == TransferType.deposit
              ? 'Deposit Cash'
              : 'Withdraw Cash',
          style: AppText.xLargeSB.copyWith(
            color: AppColors.white,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'Cancel',
              style: AppText.largeN.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Current Balance Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  // border: Border.all(
                  //   color: AppColors.greyNew,
                  //   width: 0.5,
                  // ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Current Balance',
                      style: AppText.smallN.copyWith(
                        color: AppColors.greyText,
                      ),
                    ),
                    Text(
                      numberFormat.format(widget.currentBalance),
                      style: AppText.largeN.copyWith(
                        color: AppColors.brandGold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Keyboard Section
            Expanded(
              child: SingleChildScrollView(
                child: CustomDigitKeybord(
                  transferType: widget.transferType,
                  onValueChanged: _handleValueChanged,
                  onSubmit: _handleSubmit,
                  // maxLength: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:app/shared/providers/keyboard_value_provider/keyboard_value_provider.dart';
import 'package:app/shared/shared.dart';
import 'package:app/shared/widgets/custom_keybord/animated_keyboard_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod_theme/hancod_theme.dart';

enum TransferType { deposit, withdraw }

class CustomDigitKeybord extends ConsumerWidget {
  const CustomDigitKeybord({
    required this.transferType,
    required this.onValueChanged,
    required this.onSubmit,
    super.key,
    this.maxLength = 8,
  });

  final TransferType transferType;
  final void Function(String value) onValueChanged;
  final void Function(String value) onSubmit;
  final int maxLength;

  void _onDigitPressed(WidgetRef ref, String digit) {
    ref.read(keyboardValueProvider.notifier).addDigit(digit, maxLength);
    onValueChanged(ref.read(keyboardValueProvider));
  }

  void _onDeletePressed(WidgetRef ref) {
    ref.read(keyboardValueProvider.notifier).deleteDigit();
    onValueChanged(ref.read(keyboardValueProvider));
  }

  void _onQuickAmountPressed(WidgetRef ref, String amount) {
    ref.read(keyboardValueProvider.notifier).setAmount(amount);
    onValueChanged(ref.read(keyboardValueProvider));
  }

  void _onSubmitPressed(WidgetRef ref, String value) {
    if (value.isNotEmpty) {
      onSubmit(value);
      ref.read(keyboardValueProvider.notifier).clear();
    }
  }

  Widget _buildKeyButton(
    WidgetRef ref,
    String label, {
    VoidCallback? onPressed,
  }) {
    return AnimatedKeyboardButton(
      label: label,
      onPressed: onPressed ?? () => _onDigitPressed(ref, label),
    );
  }

  Widget _buildQuickAmountButton(WidgetRef ref, String amount) {
    return AppButton(
      onPress: () => _onQuickAmountPressed(ref, amount),
      // style: ButtonStyles.primary,
      color: const Color(0xFFF3F3F3),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      label: Text(
        '\$$amount',
        style: AppText.smallM.copyWith(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentValue = ref.watch(keyboardValueProvider);

    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Display value
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  r'$ ',
                  style: AppText.heading6.copyWith(
                    fontWeight: FontWeight.w300,
                    color: AppColors.greyNew.withValues(alpha: 0.5),
                  ),
                ),
                Text(
                  currentValue.isEmpty ? '0.00' : currentValue,
                  style: AppText.heading1.copyWith(
                    fontWeight: FontWeight.w500,
                    color: currentValue.isEmpty
                        ? AppColors.greyNew.withValues(alpha: 0.5)
                        : AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),

          // Quick amount buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildQuickAmountButton(ref, '500')),
                const SizedBox(width: 12),
                Expanded(child: _buildQuickAmountButton(ref, '1000')),
                const SizedBox(width: 12),
                Expanded(child: _buildQuickAmountButton(ref, '1500')),
              ],
            ),
          ),

          // Submit button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    onPress: currentValue.isEmpty
                        ? null
                        : () => _onSubmitPressed(ref, currentValue),
                    label: Text(
                      transferType == TransferType.deposit
                          ? context.l10n.requestDeposit
                          : context.l10n.requestWithdraw,
                      style: AppText.mediumM,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Keyboard
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Row 1: 1, 2, 3
                Row(
                  children: [
                    Expanded(child: _buildKeyButton(ref, '1')),
                    const SizedBox(width: 12),
                    Expanded(child: _buildKeyButton(ref, '2')),
                    const SizedBox(width: 12),
                    Expanded(child: _buildKeyButton(ref, '3')),
                  ],
                ),
                const SizedBox(height: 12),

                // Row 2: 4, 5, 6
                Row(
                  children: [
                    Expanded(child: _buildKeyButton(ref, '4')),
                    const SizedBox(width: 12),
                    Expanded(child: _buildKeyButton(ref, '5')),
                    const SizedBox(width: 12),
                    Expanded(child: _buildKeyButton(ref, '6')),
                  ],
                ),
                const SizedBox(height: 12),

                // Row 3: 7, 8, 9
                Row(
                  children: [
                    Expanded(child: _buildKeyButton(ref, '7')),
                    const SizedBox(width: 12),
                    Expanded(child: _buildKeyButton(ref, '8')),
                    const SizedBox(width: 12),
                    Expanded(child: _buildKeyButton(ref, '9')),
                  ],
                ),
                const SizedBox(height: 12),

                // Row 4: ., 0, delete
                Row(
                  children: [
                    Expanded(
                      child: AnimatedKeyboardButton(
                        label: '.',
                        onPressed: () => _onDigitPressed(ref, '.'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: _buildKeyButton(ref, '0')),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AnimatedKeyboardButton(
                        label: '',
                        isIcon: true,
                        icon: const Icon(
                          Icons.backspace_outlined,
                          color: AppColors.primaryColor,
                          size: 24,
                        ),
                        onPressed: () => _onDeletePressed(ref),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod_theme/hancod_theme.dart';
// import 'package:starter_theme/starter_theme.dart';

class ConfirmationDialog extends ConsumerWidget {
  const ConfirmationDialog({
    required this.children,
    this.title,
    super.key,
    this.onPositive,
    this.onNegative,
    this.negativeText,
    this.positiveText,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.isLoading = false,
    this.icon,
    this.isNegative = false,
    this.positiveButtonColor,
  });
  final List<Widget> children;
  final String? title;
  final String? negativeText;
  final String? positiveText;
  final void Function(WidgetRef ref)? onPositive;
  final void Function(WidgetRef ref)? onNegative;
  final CrossAxisAlignment crossAxisAlignment;
  final bool isLoading;
  final bool isNegative;
  final Widget? icon;
  final Color? positiveButtonColor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final dialogBgColor =
        isDarkMode ? AppColors.scaffoldBgColor : AppColors.white;
    final headerColor =
        isDarkMode ? AppColors.primaryColor2 : AppColors.fontLight2;

    return Dialog(
      backgroundColor: dialogBgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  spacing: 12,
                  children: [
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: icon ??
                          const Icon(
                            Icons.highlight_remove_outlined,
                            color: AppColors.white,
                          ),
                    ),
                    Text(
                      title ?? '',
                      style: AppText.mediumSB,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  height: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.white.withValues(alpha: 0),
                        AppColors.brandGold.withValues(alpha: 0.6),
                        AppColors.white.withValues(alpha: 0),
                      ],
                      stops: const [-0.5, 0.5, 1.5],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (isSmallScreen)
              Row(
                children: [
                  if (isNegative) ...[
                    Expanded(
                      child: AppButton(
                        // style: ButtonStyles.primary,
                        // color: AppColors.reportBrown,
                        onPress: () {
                          if (onNegative != null) {
                            onNegative?.call(ref);
                          } else {
                            context.pop(false);
                          }
                        },
                        label: Text(negativeText ?? context.l10n.cancel),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: AppButton(
                      style: isNegative
                          ? ButtonStyles.secondary
                          : ButtonStyles.primary,
                      isLoading: isLoading,
                      color: positiveButtonColor,
                      onPress: () {
                        onPositive?.call(ref);
                      },
                      label: Text(positiveText ?? 'Save'),
                    ),
                  ),
                ],
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (isNegative) ...[
                    AppButton(
                      style: ButtonStyles.cancel,
                      onPress: () {
                        onNegative?.call(ref);
                        context.pop(false);
                      },
                      label: Text(negativeText ?? context.l10n.cancel),
                    ),
                    const SizedBox(height: 12),
                  ],
                  AppButton(
                    isLoading: isLoading,
                    onPress: () {
                      onPositive?.call(ref);
                    },
                    label: Text(positiveText ?? 'Save'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:app/shared/utils/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:hancod_theme/colors.dart';
import 'package:hancod_theme/text.dart';

class CashBalanceCard extends StatelessWidget {
  const CashBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.images.cardBaground.path,
          ),
          fit: BoxFit.cover,
        ),
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Assets.images.chip.svg(),
              Assets.images.appName.svg(
                colorFilter:
                    const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                width: 80,
              ),
            ],
          ),
          const SizedBox(height: 21),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cash Balance',
                        style: AppText.mediumN.copyWith(
                          color: const Color(0xFFECECEC),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            r'$20,000.12',
                            style: AppText.sb24.copyWith(
                              color: const Color(0xFFF4F4F4),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.visibility_outlined,
                            color: Color(0xFF626262),
                            size: 16,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'GB68TRWI23147094939279',
                        style: AppText.smallN.copyWith(
                          color: const Color(0xFFECECEC),
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.05),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Assets.icons.depositeCash.svg(
                        height: 15,
                        width: 15,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.05),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Assets.icons.withdrawCash.svg(
                        height: 15,
                        width: 15,
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

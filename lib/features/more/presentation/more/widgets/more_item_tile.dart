import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod_theme/hancod_theme.dart';

class MoreListItem extends ConsumerWidget {
  const MoreListItem({
    required this.name,
    required this.icon,
    this.onTap,
    super.key,
  });
  final String name;
  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.scaffoldBgColor,
              ),
              child: icon,
            ),
            const SizedBox(width: 16),
            Text(
              name,
              style: AppText.mediumM,
            ),
          ],
        ),
      ),
    );
  }
}

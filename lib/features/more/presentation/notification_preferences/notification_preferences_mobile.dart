import 'package:app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod_theme/hancod_theme.dart';

class NotificationPreferencesScreenMobile extends ConsumerStatefulWidget {
  const NotificationPreferencesScreenMobile({super.key});

  @override
  ConsumerState<NotificationPreferencesScreenMobile> createState() =>
      _NotificationPreferencesScreenMobileState();
}

class _NotificationPreferencesScreenMobileState
    extends ConsumerState<NotificationPreferencesScreenMobile> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(
        // leadingWidth: 10,
        title: Text(
          l10n.notificationPreferences,
          style: AppText.mediumN.copyWith(color: AppColors.title),
        ),
      ),
      body: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: AppColors.white,
            child: Column(
              children: [
                ListTile(
                  tileColor: Colors.transparent,
                  titleTextStyle:
                      AppText.mediumM.copyWith(color: AppColors.black),
                  title: Text(l10n.pushNotifications),
                  subtitle: Text(l10n.receiveNotificationsOnYourDevice),
                  subtitleTextStyle: AppText.smallN.copyWith(
                    color: AppColors.fontLight3,
                  ),
                  trailing: const SizedBox(
                    width: 50,
                    child: AppToggleForm(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      name: 'notification',
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.white.withValues(alpha: 0),
                        AppColors.brandGold.withValues(alpha: 0.4),
                        AppColors.white.withValues(alpha: 0),
                      ],
                      stops: const [0.1, 0.5, 0.9],
                    ),
                  ),
                ),
                ListTile(
                  tileColor: Colors.transparent,
                  titleTextStyle:
                      AppText.mediumM.copyWith(color: AppColors.black),
                  title: Text(l10n.pushNotifications),
                  subtitle: Text(l10n.newFeatureAndImprovements),
                  subtitleTextStyle: AppText.smallN.copyWith(
                    color: AppColors.fontLight3,
                  ),
                  trailing: const SizedBox(
                    width: 50,
                    child: AppToggleForm(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      name: 'notification',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

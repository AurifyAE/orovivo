import 'package:app/features/more/more.dart';
import 'package:app/shared/shared.dart';
import 'package:app/shared/utils/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod_theme/hancod_theme.dart';

class AccountSettingsScreenMobile extends ConsumerStatefulWidget {
  const AccountSettingsScreenMobile({super.key});

  @override
  ConsumerState<AccountSettingsScreenMobile> createState() =>
      _AccountSettingsScreenMobileState();
}

class _AccountSettingsScreenMobileState
    extends ConsumerState<AccountSettingsScreenMobile> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final groupedModules = <String, List<Map<String, dynamic>>>{
      'Sales': [
        {
          'onTap': () {
            AppRouter.pushNamed(AppRouter.changePassword);
          },
          'title': 'Change Password',
          'icon': Assets.icons.changePassword.svg(
            height: 20,
            width: 20,
            colorFilter: const ColorFilter.mode(
              Color(0xFF7E7E7E),
              BlendMode.srcIn,
            ),
          ),
        },
        {
          'onTap': () {
            // AppRouter.pushNamed(AppRouter.helpAndSupport);
          },
          'title': 'Logout',
          'icon': Assets.icons.logOut.svg(
            colorFilter: const ColorFilter.mode(
              Color(0xFF7E7E7E),
              BlendMode.srcIn,
            ),
          ),
        },
      ],
    };
    return Scaffold(
      appBar: CustomAppBar(
        // leadingWidth: 10,
        title: Text(
          l10n.accountSettings,
          style: AppText.mediumN.copyWith(color: AppColors.title),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage(Assets.images.background.path))),
        child: Column(
          children: [
            Card(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: groupedModules['Sales']!.length,
                  itemBuilder: (context, index) {
                    final moduleData = groupedModules['Sales']![index];
                    return MoreListItem(
                      name: moduleData['title'] as String,
                      icon: moduleData['icon'] as Widget,
                      onTap: moduleData['onTap'] as void Function()?,
                    );
                  },
                  separatorBuilder: (context, index) => Container(
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
                ),
              ),
            ),
            const SizedBox(height: 14),
            TextButton(
              onPressed: () {
                context.pushNamed(AppRouter.deleteAccount);
              },
              child: Text(
                l10n.deleteAccount,
                style: AppText.mediumN.copyWith(color: AppColors.darkRed),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

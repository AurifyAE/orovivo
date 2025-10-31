import 'package:app/shared/utils/assets.gen.dart';
import 'package:app/shared/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod_theme/colors.dart';
import 'package:hancod_theme/hancod_theme.dart';
import 'package:hancod_theme/text.dart';

class ProfilePictureScreenMobile extends ConsumerStatefulWidget {
  const ProfilePictureScreenMobile({super.key});

  @override
  ConsumerState<ProfilePictureScreenMobile> createState() =>
      _ProfilePictureScreenMobileState();
}

class _ProfilePictureScreenMobileState
    extends ConsumerState<ProfilePictureScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Add a Profile Picture',
              style: AppText.largeN,
            ),
            const SizedBox(height: 4),
            Text(
              'Help others recognize you with a photo',
              style: AppText.mediumN.copyWith(
                color: AppColors.fontLight3,
              ),
            ),
            const SizedBox(height: 32),
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  stops: [0.0, 0.25, 0.5, 1.0],
                  colors: [
                    AppColors.white,
                    AppColors.brandGold,
                    AppColors.white,
                    AppColors.white,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.5),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Assets.icons.avatar.svg(
                      height: 5,
                      width: 5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        Assets.icons.camera.svg(),
                        const SizedBox(height: 15),
                        Text(
                          'Take Photo',
                          style: AppText.smallN.copyWith(
                            color: AppColors.fontLight3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        Assets.icons.gallery.svg(),
                        const SizedBox(height: 15),
                        Text(
                          'Choose from Gallery',
                          style: AppText.smallN.copyWith(
                            color: AppColors.fontLight3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    onPress: () {
                      context.pushNamed(AppRouter.registrationSuccess);
                    },
                    label: const Text('Finish Setup'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    elevation: 0,
                    color: AppColors.scaffoldBgColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    onPress: () {},
                    label: Text(
                      'Skip For Now',
                      style: AppText.mediumM.copyWith(
                        color: AppColors.fontLight3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

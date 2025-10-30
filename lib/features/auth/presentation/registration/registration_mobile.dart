import 'package:app/shared/utils/assets.gen.dart';
import 'package:app/shared/widgets/appbar.dart';
import 'package:app/shared/widgets/lottie_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hancod_theme/hancod_theme.dart';

class RegistrationScreenMobile extends ConsumerStatefulWidget {
  const RegistrationScreenMobile({super.key});

  @override
  ConsumerState<RegistrationScreenMobile> createState() =>
      _RegistrationScreenMobileState();
}

class _RegistrationScreenMobileState
    extends ConsumerState<RegistrationScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.registerBgPng.path),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 84, bottom: 77),
              child: Assets.images.appIconWithName.svg(),
            ),
            const Text(
              'Welcome Back',
              style: AppText.sb20,
            ),
            const SizedBox(height: 8),
            Text(
              'Login to continue your gold investments',
              style: AppText.mediumN.copyWith(color: AppColors.secondaryColor),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: AppColors.white,
              surfaceTintColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Ink(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: const Color(0xfff2f2f2),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              radius: 6,
                              onPress: () {},
                              label: const Text('Login'),
                            ),
                          ),
                          Expanded(
                            child: AppButton(
                              radius: 6,
                              onPress: () {},
                              label: const Text('Register'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

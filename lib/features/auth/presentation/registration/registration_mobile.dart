import 'package:app/shared/utils/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod_theme/hancod_theme.dart';

enum AuthType { login, register }

class RegistrationScreenMobile extends ConsumerStatefulWidget {
  const RegistrationScreenMobile({super.key});

  @override
  ConsumerState<RegistrationScreenMobile> createState() =>
      _RegistrationScreenMobileState();
}

class _RegistrationScreenMobileState
    extends ConsumerState<RegistrationScreenMobile> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: _formKey,
        initialValue: {
          'authType': AuthType.register,
        },
        child: Container(
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
                style:
                    AppText.mediumN.copyWith(color: AppColors.secondaryColor),
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
                    spacing: 16,
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
                                label: Text(
                                  'Login',
                                  style: AppText.mediumM.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: AppButton(
                                // isEnabled: false,
                                color: const Color(0xfff2f2f2),
                                radius: 6,
                                onPress: () {},
                                label: Text(
                                  'Register',
                                  style: AppText.mediumM.copyWith(
                                    color: AppColors.greyText,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Offstage(
                        offstage: false,
                        // offstage: _formKey.currentState?.value['authType'] !=
                        //     AuthType.login,
                        child: Column(
                          spacing: 16,
                          children: [
                            AppTextForm<String>(
                              labelSpacing: 4,
                              label: 'User Name',
                              labelStyle: AppText.smallSB.copyWith(
                                color: AppColors.stormyBlue,
                              ),
                              name: 'user_name',
                            ),
                            AppTextForm<String>(
                              labelSpacing: 4,
                              enableObscureText: true,
                              label: 'Password',
                              labelStyle: AppText.smallSB.copyWith(
                                color: AppColors.stormyBlue,
                              ),
                              name: 'password',
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: AppButton(
                                    onPress: () {},
                                    label: const Text('Login'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'New here? ',
                      style:
                          AppText.mediumN.copyWith(color: AppColors.greyText),
                    ),
                    TextSpan(
                      text: 'Register',
                      style: AppText.mediumM
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:app/features/auth/auth.dart';
import 'package:app/shared/shared.dart';
import 'package:app/shared/utils/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
    final state = ref.watch(registrationNotifierProvider);
    final notifier = ref.watch(registrationNotifierProvider.notifier);
    return Scaffold(
      body: FormBuilder(
        key: _formKey,
        // initialValue: const {
        //   'authType': AuthType.register,
        // },
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
          child: SingleChildScrollView(
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
                                  color: state.authType == AuthType.login
                                      ? AppColors.black
                                      : const Color(0xfff2f2f2),
                                  onPress: () {
                                    notifier.changeAuthType(AuthType.login);
                                  },
                                  label: Text(
                                    'Login',
                                    style: AppText.mediumM.copyWith(
                                      color: state.authType == AuthType.login
                                          ? AppColors.white
                                          : AppColors.greyText,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: AppButton(
                                  // isEnabled: false,
                                  color: state.authType == AuthType.register
                                      ? AppColors.black
                                      : const Color(0xfff2f2f2),
                                  radius: 6,
                                  onPress: () {
                                    notifier.changeAuthType(AuthType.register);
                                  },
                                  label: Text(
                                    'Register',
                                    style: AppText.mediumM.copyWith(
                                      color: state.authType == AuthType.register
                                          ? AppColors.white
                                          : AppColors.greyText,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Offstage(
                          offstage: state.authType != AuthType.login,
                          // offstage: _formKey.currentState?.value['authType'] !=
                          //     AuthType.login,
                          child: Column(
                            spacing: 16,
                            children: [
                              AppTextForm<String>(
                                labelSpacing: 4,
                                label: 'User Name',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: 'Please enter User Name',
                                  ),
                                ]),
                                labelStyle: AppText.smallSB.copyWith(
                                  color: AppColors.stormyBlue,
                                ),
                                name: 'user_name',
                              ),
                              AppTextForm<String>(
                                labelSpacing: 4,
                                enableObscureText: true,
                                label: 'Password',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: 'Please enter Password',
                                  ),
                                ]),
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
                        Offstage(
                          offstage: state.authType != AuthType.register,
                          // offstage: _formKey.currentState?.value['authType'] !=
                          //     AuthType.login,
                          child: Column(
                            spacing: 16,
                            children: [
                              AppTextForm<String>(
                                labelSpacing: 4,
                                label: 'User Name',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: 'Please enter User Name',
                                  ),
                                ]),
                                labelStyle: AppText.smallSB.copyWith(
                                  color: AppColors.stormyBlue,
                                ),
                                name: 'user_name_reg',
                              ),
                              AppTextForm<String>(
                                labelSpacing: 4,
                                // enableObscureText: true,
                                label: 'email',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: 'Please enter email',
                                  ),
                                  FormBuilderValidators.email(
                                    errorText: 'Please enter valid email',
                                  ),
                                ]),
                                labelStyle: AppText.smallSB.copyWith(
                                  color: AppColors.stormyBlue,
                                ),
                                name: 'email',
                              ),
                              AppPhoneNumberForm(
                                name: 'phone',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: 'Please enter phone number',
                                  ),
                                  FormBuilderValidators.phoneNumber(
                                    errorText:
                                        'Please enter valid phone number',
                                  ),
                                ]),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppButton(
                                      onPress: () {
                                        AppRouter.pushNamed(AppRouter.password);
                                      },
                                      label: const Text(
                                        'Register',
                                      ),
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
                if (state.authType == AuthType.login)
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'New here? ',
                          style: AppText.mediumN
                              .copyWith(color: AppColors.greyText),
                        ),
                        TextSpan(
                          text: 'Register',
                          style: AppText.mediumM
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  )
                else
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: AppText.mediumN
                              .copyWith(color: AppColors.greyText),
                        ),
                        TextSpan(
                          text: 'Login',
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
      ),
    );
  }
}

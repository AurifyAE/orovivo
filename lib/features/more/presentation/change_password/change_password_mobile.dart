import 'package:app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod_theme/hancod_theme.dart';

class ChangePasswordScreenMobile extends ConsumerStatefulWidget {
  const ChangePasswordScreenMobile({super.key});

  @override
  ConsumerState<ChangePasswordScreenMobile> createState() =>
      _ChangePasswordScreenMobileState();
}

class _ChangePasswordScreenMobileState
    extends ConsumerState<ChangePasswordScreenMobile> {
  final _formKey = GlobalKey<FormBuilderState>();
  String _password = '';
  bool _hasAttemptedSubmit = false;

  bool get _hasMinLength => _password.length >= 8;
  bool get _hasUppercase => _password.contains(RegExp('[A-Z]'));
  bool get _hasNumber => _password.contains(RegExp('[0-9]'));
  bool get _hasSpecialChar =>
      _password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          l10n.changePassword,
          style: AppText.mediumN.copyWith(color: AppColors.title),
        ),
      ),
      body: FormBuilder(
        initialValue: const {
          'password': '123!#@Asdfgh',
          'confirm_password': '123!#@Asdfgh',
        },
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        Column(
                          spacing: 16,
                          children: [
                            AppTextForm<String>(
                              labelSpacing: 8,
                              enableObscureText: true,
                              label: l10n.currentPassword,
                              secondaryLabel: l10n.enterCurrentPassword,
                              onChanged: (value) {
                                setState(() {
                                  _password = value ?? '';
                                });
                              },
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  errorText: l10n.pleaseEnterPassword,
                                ),
                                FormBuilderValidators.minLength(
                                  8,
                                  errorText:
                                      l10n.passwordMustBeAtLeast8Characters,
                                ),
                              ]),
                              labelStyle: AppText.smallSB.copyWith(
                                color: AppColors.stormyBlue,
                              ),
                              name: 'current_password',
                            ),
                            AppTextForm<String>(
                              labelSpacing: 8,
                              enableObscureText: true,
                              label: l10n.newPassword,
                              secondaryLabel: l10n.enterNewPassword,
                              onChanged: (value) {
                                setState(() {
                                  _password = value ?? '';
                                });
                              },
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  errorText: l10n.pleaseEnterNewPassword,
                                ),
                                FormBuilderValidators.minLength(
                                  8,
                                  errorText:
                                      l10n.passwordMustBeAtLeast8Characters,
                                ),
                              ]),
                              labelStyle: AppText.smallSB.copyWith(
                                color: AppColors.stormyBlue,
                              ),
                              name: 'password',
                            ),
                            AppTextForm<String>(
                              labelSpacing: 8,
                              enableObscureText: true,
                              label: l10n.confirmPassword,
                              secondaryLabel: l10n.enterConfirmPassword,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  errorText: l10n.pleaseEnterConfirmPassword,
                                ),
                                (value) {
                                  if (value !=
                                      _formKey.currentState?.fields['password']
                                          ?.value) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ]),
                              labelStyle: AppText.smallSB.copyWith(
                                color: AppColors.stormyBlue,
                              ),
                              name: 'confirm_password',
                            ),
                            const SizedBox(height: 10),
                            _buildPasswordChecker(),
                            Row(
                              children: [
                                Expanded(
                                  child: AppButton(
                                    onPress: () {
                                      setState(() {
                                        _hasAttemptedSubmit = true;
                                      });

                                      _formKey.currentState?.validate();

                                      if (_formKey.currentState
                                              ?.saveAndValidate() ??
                                          false) {
                                        if (!_hasMinLength ||
                                            !_hasUppercase ||
                                            !_hasNumber) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Please meet all password requirements',
                                                style: AppText.mediumN.copyWith(
                                                  color: AppColors.white,
                                                ),
                                              ),
                                              backgroundColor: AppColors.red,
                                            ),
                                          );
                                          return;
                                        }

                                        final formData =
                                            _formKey.currentState?.value;

                                        context.pushNamed(
                                          AppRouter.profilePicture,
                                        );
                                        debugPrint(
                                          'Password validated: ${formData?['password']}',
                                        );
                                      }
                                    },
                                    label: Text(
                                      l10n.resetPassword,
                                      style: AppText.mediumM.copyWith(
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordChecker() {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPasswordRequirement(
          'Minimum 8 characters',
          _hasMinLength,
        ),
        _buildPasswordRequirement(
          'At least one uppercase letter',
          _hasUppercase,
        ),
        _buildPasswordRequirement(
          'At least one number',
          _hasNumber,
        ),
        _buildPasswordRequirement(
          'Use special characters for better strength',
          _hasSpecialChar,
        ),
      ],
    );
  }

  Widget _buildPasswordRequirement(String text, bool isMet) {
    Color iconColor;
    Color textColor;

    if (isMet) {
      iconColor = AppColors.black;
      textColor = AppColors.greyText;
    } else if (_hasAttemptedSubmit) {
      iconColor = AppColors.red;
      textColor = AppColors.red;
    } else {
      iconColor = const Color(0xFFF2F2F2);
      textColor = AppColors.fontLight3;
    }

    return Row(
      children: [
        Icon(
          isMet ? Icons.check_circle : Icons.circle,
          size: 20,
          color: iconColor,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: AppText.smallN.copyWith(
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}

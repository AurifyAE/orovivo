import 'package:app/shared/shared.dart';
import 'package:app/shared/widgets/conformation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hancod_theme/hancod_theme.dart';

class DeleteAccountScreenMobile extends ConsumerStatefulWidget {
  const DeleteAccountScreenMobile({super.key});

  @override
  ConsumerState<DeleteAccountScreenMobile> createState() =>
      _DeleteAccountScreenMobileState();
}

class _DeleteAccountScreenMobileState
    extends ConsumerState<DeleteAccountScreenMobile> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          l10n.deleteAccount,
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
                            Ink(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFAEB),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                spacing: 8,
                                children: [
                                  const Icon(
                                    Icons.warning_amber_rounded,
                                    color: AppColors.yellow,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "This will deactivate your account. You won't be able to access your account until you log in again. Your data will be safely retained and can be restored anytime.",
                                      style: AppText.smallN
                                          .copyWith(color: AppColors.yellow),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AppDropDownForm<String>(
                              labelStyle: AppText.smallSB.copyWith(
                                color: AppColors.stormyBlue,
                              ),
                              labelSpacing: 5,
                              name: 'reason',
                              label: 'Why are you deactivating your account?',
                              items: const [
                                DropDownItems(
                                  value: 'I no longer use the app',
                                  child: Text('I no longer use the app'),
                                ),
                                DropDownItems(
                                  value: 'I found a better app',
                                  child: Text("I'll back later"),
                                ),
                              ],
                            ),
                            AppTextForm<String>(
                              labelSpacing: 5,
                              enableObscureText: true,
                              label: 'To Confirm, Enter Password',
                              // secondaryLabel: l10n.enterConfirmPassword,
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
                            // const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: AppButton(
                                    onPress: () {
                                      showDialog<void>(
                                        context: context,
                                        builder: (context) {
                                          return ConfirmationDialog(
                                            isNegative: true,
                                            icon: Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFFFF5F5),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                size: 20,
                                                color: Color(0xFFEF4747),
                                                Icons.warning_amber_rounded,
                                              ),
                                            ),
                                            title: l10n.deleteAccount,
                                            onPositive: (ref) {
                                              // _formKey.currentState?.save();
                                              // if (_formKey.currentState?.validate() ?? false) {
                                              //   ref.read(authProvider.notifier).deleteAccount();
                                              // }
                                            },
                                            positiveText: l10n.delete,
                                            children: [
                                              Text(
                                                'Are you sure you want to delete this Account?',
                                                style: AppText.mediumM.copyWith(
                                                  color: AppColors.fontLight3,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    label: Text(
                                      l10n.deleteAccount,
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
}

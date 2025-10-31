part of 'registration_notifier.dart';

enum RegistrationStatus {
  initial,
  loading,
  success,
  error,
}

extension RegistrationStatusExtension on RegistrationStatus {
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function() success,
    required R Function() error,
  }) {
    switch (this) {
      case RegistrationStatus.initial:
        return initial();
      case RegistrationStatus.loading:
        return loading();
      case RegistrationStatus.success:
        return success();
      case RegistrationStatus.error:
        return error();
    }
  }
}

@freezed
abstract class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @Default(RegistrationStatus.initial) RegistrationStatus status,
    @Default(AuthType.login) AuthType authType,
  }) = _RegistrationState;

  factory RegistrationState.initial() => const RegistrationState();
}

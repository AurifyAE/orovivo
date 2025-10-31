import 'package:app/features/auth/presentation/auth_presentation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'registration_notifier.freezed.dart';
part 'registration_notifier.g.dart';
part 'registration_state.dart';

@Riverpod(keepAlive: false)
class RegistrationNotifier extends _$RegistrationNotifier {
  @override
  RegistrationState build() {
    return RegistrationState.initial();
  }

  void changeAuthType(AuthType authType) {
    state = state.copyWith(authType: authType);
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'keyboard_value_provider.g.dart';

@riverpod
class KeyboardValue extends _$KeyboardValue {
  @override
  String build() {
    return '';
  }

  void addDigit(String digit, int maxLength) {
    if (state.length < maxLength) {
      state = state + digit;
    }
  }

  void deleteDigit() {
    if (state.isNotEmpty) {
      state = state.substring(0, state.length - 1);
    }
  }

  void setAmount(String amount) {
    state = amount;
  }

  void clear() {
    state = '';
  }
}

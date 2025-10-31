import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/features/more/more.dart';
import 'package:app/shared/shared.dart';

export 'delete_account_mobile.dart';
export 'delete_account_web.dart';

class DeleteAccountScreen extends ConsumerWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ResponsiveWidget(
        smallScreen: DeleteAccountScreenMobile(),
        largeScreen: DeleteAccountScreenWeb(),
      ),
    );
  }
}

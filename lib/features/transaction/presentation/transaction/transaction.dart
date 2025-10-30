import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/features/transaction/transaction.dart';
import 'package:app/shared/shared.dart';

export 'transaction_mobile.dart';
export 'transaction_web.dart';

class TransactionScreen extends ConsumerWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ResponsiveWidget(
        smallScreen: TransactionScreenMobile(),
        largeScreen: TransactionScreenWeb(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/features/auth/auth.dart';
import 'package:app/shared/shared.dart';

export 'profile_picture_mobile.dart';
export 'profile_picture_web.dart';

class ProfilePictureScreen extends ConsumerWidget {
  const ProfilePictureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: ResponsiveWidget(
        smallScreen: ProfilePictureScreenMobile(),
        largeScreen: ProfilePictureScreenWeb(),
      ),
    );
  }
}

import 'package:app/shared/utils/assets.gen.dart';
import 'package:flutter/material.dart';

/// Example widget demonstrating how to use Lottie animations with Assets.gen
class LottieExample extends StatelessWidget {
  const LottieExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottie Animation Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Method 1: Using .lottie() method (recommended)
            Assets.lottie.gold.lottie(
              width: 200,
              height: 200,
              repeat: true,
              animate: true,
            ),
            Assets.lottie.success.lottie(
              width: 200,
              height: 200,
              repeat: false,
              animate: true,
            ),

            const SizedBox(height: 20),

            // Method 2: Using .lottie() with custom controller
            Assets.lottie.loading.lottie(
              width: 150,
              height: 150,
              repeat: true,
              reverse: false,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),

            // You can also access the path directly
            Text('Gold animation path: ${Assets.lottie.gold.path}'),
            Text('Loading animation path: ${Assets.lottie.loading.path}'),
          ],
        ),
      ),
    );
  }
}

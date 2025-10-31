import 'package:app/shared/utils/assets.gen.dart';
import 'package:app/shared/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod_theme/hancod_theme.dart';
import 'package:lottie/lottie.dart';

class RegistrationSuccessScreenMobile extends ConsumerStatefulWidget {
  const RegistrationSuccessScreenMobile({
    super.key,
    this.title = 'Success',
    this.subTitle = 'Your Action was successful!',
    this.onTap,
  });
  final String? title;
  final String? subTitle;
  final VoidCallback? onTap;

  @override
  ConsumerState<RegistrationSuccessScreenMobile> createState() =>
      _RegistrationSuccessScreenMobileState();
}

class _RegistrationSuccessScreenMobileState
    extends ConsumerState<RegistrationSuccessScreenMobile>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _titleSlideAnimation;
  late Animation<Offset> _subtitleSlideAnimation;
  late Animation<Offset> _buttonSlideAnimation;
  late Animation<double> _fadeAnimation;

  bool _showContent = false;

  @override
  void initState() {
    super.initState();

    // Initialize slide animation controller
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Create staggered slide animations
    _titleSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: const Interval(0, 0.5, curve: Curves.easeOut),
      ),
    );

    _subtitleSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: const Interval(0.2, 0.7, curve: Curves.easeOut),
      ),
    );

    _buttonSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: const Interval(0.4, 1, curve: Curves.easeOut),
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  void _onLottieLoaded(LottieComposition composition) {
    Future.delayed(composition.duration, () {
      if (mounted) {
        setState(() {
          _showContent = true;
        });
        _slideController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.regSucBg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.lottie.success.lottie(
              width: 150,
              height: 150,
              repeat: false,
              animate: true,
              onLoaded: _onLottieLoaded,
            ),
            const SizedBox(height: 35),
            if (_showContent) ...[
              SlideTransition(
                position: _titleSlideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    textAlign: TextAlign.center,
                    widget.title!,
                    style: AppText.m20,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SlideTransition(
                position: _subtitleSlideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    textAlign: TextAlign.center,
                    widget.subTitle!,
                    style: AppText.mediumN.copyWith(
                      color: AppColors.fontLight3,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              SlideTransition(
                position: _buttonSlideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                          // onPress: widget.onTap,
                          onPress: () {
                            context.goNamed(AppRouter.home);
                          },
                          label: const Text('Continue'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

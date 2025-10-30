import 'package:flutter/material.dart';
import 'package:hancod_theme/hancod_theme.dart';

class AnimatedKeyboardButton extends StatefulWidget {
  const AnimatedKeyboardButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.isIcon = false,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isIcon;
  final Widget? icon;

  @override
  State<AnimatedKeyboardButton> createState() => _AnimatedKeyboardButtonState();
}

class _AnimatedKeyboardButtonState extends State<AnimatedKeyboardButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.forward().then((_) {
      _controller.reverse();
    });
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _handleTap,
          borderRadius: BorderRadius.circular(10),
          splashColor: AppColors.greyNew.withValues(alpha: 0.2),
          highlightColor: AppColors.greyNew.withValues(alpha: 0.1),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: widget.isIcon
                  ? widget.icon!
                  : Text(
                      widget.label,
                      style: AppText.heading4.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hancod_theme/colors.dart';

class AppBarButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  const AppBarButton({
    super.key, required this.onPressed, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.title, // inner darker ring
            AppColors.primaryColor2, // inner darker ring
            // Color(0xFF1C1C1C), // outer darker tone
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ), 
        shape: BoxShape.circle,
      ),
      child: Container(
        // height: 20,   
        padding: const EdgeInsets.all(1), 
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColor, 
            width: 3,
          ),
        gradient: const LinearGradient(
          colors: [
            AppColors.title, // inner darker ring
            AppColors.primaryColor2, // inner darker ring
            // Color(0xFF1C1C1C), // outer darker tone
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ), 
        shape: BoxShape.circle,
      ),
        child: Container(
          
          // padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColors.primaryColor, 
        shape: BoxShape.circle,),
          child: IconButton(onPressed: () {}, icon: icon)))); 
  }
}
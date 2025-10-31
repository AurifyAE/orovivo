import 'package:flutter/material.dart';
import 'package:hancod_theme/colors.dart';

class CountCard extends StatelessWidget {
  Color statusColor;
  String count;
  String status;  
   CountCard({
    super.key,
    required this.statusColor,
    required this.count,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60, 
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border(
            bottom: BorderSide(
              color: statusColor,
              width: 4,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count,
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold,
                color: AppColors.black, 
              ),
            ),
            Text(
              status,
              style: TextStyle(
                fontSize: 10, 
                fontWeight: FontWeight.w500,
                color: AppColors.title2,  
              ),
            ),
          ],
        ),
      ),
    );
  }
}
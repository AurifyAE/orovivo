import 'package:app/shared/utils/assets.gen.dart';
import 'package:app/shared/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod_theme/colors.dart';

class HomeNavigationBar extends ConsumerStatefulWidget {
  const HomeNavigationBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends ConsumerState<HomeNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor, 
      body: widget.navigationShell,

      // 🟢 Floating Center Button
     // 🟢 Floating Center Button
floatingActionButton: Padding(
  padding: const EdgeInsets.only(top: 66), // ⬇️ move the FAB slightly down
  child: FloatingActionButton(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    elevation: 0,
    onPressed: () => context.pushNamed('swap'),    
    shape: const CircleBorder(),
    child: Assets.icons.floatBtn.svg(), 
  ),
),
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,  


      // 🟢 Bottom Navigation Bar with SVG Background
      bottomNavigationBar: Stack(
  alignment: Alignment.bottomCenter,
  clipBehavior: Clip.none,
  children: [
    // 🔹 Custom SVG Background (with bulge)
    Positioned.fill(
      child: Assets.images.navigationBg.svg(
        color: AppColors.white, 
        fit: BoxFit.cover,
      ),
    ),

    // 🔹 The actual navigation bar items (with height adjustment)
    SizedBox(
      height: 120, // ⬆️ Adjusted total nav bar height (try 85–95 if needed)
      child: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
    splashColor: Colors.transparent, // 🚫 Removes ripple
    highlightColor: Colors.transparent, // 🚫 Removes tap glow
    hoverColor: Colors.transparent, // 🚫 Removes hover (for web/desktop)
  ), 
          child: BottomNavigationBar(
          
            selectedItemColor: const Color(0xFF1A1A1A),
            unselectedItemColor: const Color(0xFF999999),
            backgroundColor: Colors.transparent,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 11,
              height: 1.3,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 11,
              height: 1.3,
            ),
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: <BottomNavigationBarItem>[
              _buildNavItem(
                Assets.icons.home.svg(),
                Assets.icons.homeFilled.svg(),
                'Home',
                0,
                widget.navigationShell.currentIndex,
              ),
              _buildNavItem(
                Assets.icons.transaction.svg(),
                Assets.icons.transactionFilled.svg(),
                'Transaction',
                1,
                widget.navigationShell.currentIndex,
              ),
              const BottomNavigationBarItem(
                icon: SizedBox(width: 56),
                label: '',
              ),
              _buildNavItem(
                Assets.icons.branch.svg(),
                Assets.icons.branchFilled.svg(),
                'Branch',
                2,
                widget.navigationShell.currentIndex,  
              ),
              _buildNavItem(
                Assets.icons.more.svg(), 
                Assets.icons.moreFilled.svg(),
                'More',
                3,
                widget.navigationShell.currentIndex,
              ),
            ],
            currentIndex: _adjustedIndex(widget.navigationShell.currentIndex),
            onTap: (index) async {
              if (index == 2) return;
              final actualIndex = index > 2 ? index - 1 : index;
              widget.navigationShell.goBranch(actualIndex, initialLocation: true);
            },
          ),
        ),
      ),
    ), 
  ],
),

    );
  }

  int _adjustedIndex(int currentIndex) {
    return currentIndex >= 2 ? currentIndex + 1 : currentIndex;
  }

BottomNavigationBarItem _buildNavItem(
  SvgPicture inactiveIcon,
  SvgPicture activeIcon,
  String label,
  int index,
  int currentIndex,
) {
  final isSelected = index == currentIndex;

  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.only(top: 36),
      child: isSelected ? activeIcon : inactiveIcon, // 🟢 Switch based on state
    ),
    label: label,
  );
}


}

import 'package:app/shared/utils/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hancod_theme/hancod_theme.dart';
// import 'package:starter_theme/colors.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar({
    super.key,
    Widget? title,
    bool? centerTitle,
    List<Widget>? actions,
    double? leadingWidth,
  }) : super(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(    
              color: AppColors.primaryColor,
              image: DecorationImage( 
                image: AssetImage(Assets.images.appbarBg.path),     
                fit: BoxFit.cover, // makes it fill nicely
              ),
            ), 
            child: AppBar( 
              backgroundColor: Colors.transparent,         
              title: title,
              centerTitle: centerTitle,
              actions: actions,
              automaticallyImplyLeading: false,
              leadingWidth: leadingWidth ?? 53,
              leading: Builder(
                builder: (context) {
                  final ModalRoute<dynamic>? parentRoute =
                      ModalRoute.of(context);
                  return parentRoute?.impliesAppBarDismissal ?? false
                      ? Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent, 
                            borderRadius: BorderRadius.circular(8),
                            onTap: context.pop,
                            child:  Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Assets.icons.backArrow.svg() 
                            ),
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),
            ),
          ),
        );
}

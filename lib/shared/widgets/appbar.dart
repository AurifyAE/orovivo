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
    double? bottomHeight,
    Widget? bottom,
  }) : super(
          preferredSize: Size.fromHeight(
            kToolbarHeight + (bottomHeight ?? 0),
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: AppBar(
              bottom: bottom != null
                  ? PreferredSize(
                      preferredSize:
                          Size.fromHeight(bottomHeight ?? kToolbarHeight),
                      child: bottom,
                    )
                  : null,
              backgroundColor: AppColors.primaryColor,
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
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Ink(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.offWhite
                                      .withValues(alpha: 0.05),
                                  blurRadius: 1,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                              // border: Border.all(
                              //   color: AppColors.greyText,
                              //   width: 1.31,
                              // ),
                              // borderRadius: BorderRadius.circular(8),
                              // color: AppColors.primaryColor2,
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: context.pop,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: AppColors.greyNew,
                                ),
                              ),
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

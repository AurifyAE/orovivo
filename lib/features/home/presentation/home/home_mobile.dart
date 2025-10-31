import 'package:app/shared/utils/assets.gen.dart';
import 'package:app/shared/widgets/app_bar_button.dart';
import 'package:app/shared/widgets/appbar.dart';
import 'package:app/shared/widgets/cash_balance_card.dart';
import 'package:app/shared/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod_theme/hancod_theme.dart';

class HomeScreenMobile extends ConsumerStatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  ConsumerState<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends ConsumerState<HomeScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidth: 10,
        title: Text(
          'Hi, ANIL KUMAR',
          style: AppText.largeN.copyWith(color: AppColors.title),
        ),
        centerTitle: false,
        actions: [
          AppBarButton(
            onPressed: () {},
            icon: Assets.icons.notification.svg(),
          ),
          const SizedBox(
            width: 10,
          ),
          AppBarButton(onPressed: () {}, icon: Assets.icons.profile.svg()),
          const SizedBox(
            width: 20,
          ), // IconButton(onPressed: () {}, icon: Assets.icons.profile.svg()),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ColoredBox(
                  color: AppColors.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Gold Balance ',
                                    style: AppText.mediumN.copyWith(
                                      color: AppColors.title2,
                                      // fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '267.89 g',
                                    style: AppText.n20.copyWith(
                                      color: AppColors.title,
                                      fontSize: 38,
                                    ),
                                  ),
                                ],
                              ),
                              Assets.images.gold.svg(),
                            ],
                          ),
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          spacing: 18,
                          children: [
                            Expanded(
                              child: AppButton.icon(
                                color: AppColors.primaryColor2,
                                onPress: () {},
                                icon: Assets.icons.buy.svg(
                                  width: 20,
                                  height: 20,
                                ),
                                label: Text(
                                  'Buy Gold',
                                  style: AppText.smallM.copyWith(
                                    color: AppColors.title,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: AppButton.icon(
                                color: AppColors.primaryColor2,
                                onPress: () {},
                                icon: Assets.icons.sellGold.svg(
                                  width: 20,
                                  height: 20,
                                ),
                                label: Text(
                                  'Sell Gold',
                                  style: AppText.smallM.copyWith(
                                    color: AppColors.title,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ColoredBox(
                  color: AppColors.scaffoldBgColor,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 12,
                            height: 160,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const Flexible(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: SizedBox(
                                height: 180,
                                child: CashBalanceCard(),
                              ),
                            ),
                          ),
                          Container(
                            width: 12,
                            height: 160,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: const Alignment(
              0,
              -0.4,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 4,
                shadowColor: const Color.fromARGB(100, 36, 38, 39),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                    color: AppColors.gold2,
                    width: 2,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const RadialGradient(
                      radius: 0.8,
                      colors: [
                        Color.fromARGB(255, 61, 49, 33),
                        AppColors.primaryColor,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [
                                  AppColors.gold1,
                                  AppColors.gold3,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds),
                              child: Text(
                                'LIVE GOLD RATE',
                                style: AppText.mediumM.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFF15600B),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 13,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ASK',
                                  style: AppText.smallM.copyWith(
                                    color: AppColors.askGreen,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  r'$2043.50',
                                  style: AppText.mediumSB.copyWith(
                                    color: AppColors.black,
                                    // fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'BID',
                                  style: AppText.smallM.copyWith(
                                    color: AppColors.bidRed,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  r'$2043.50',
                                  style: AppText.mediumSB.copyWith(
                                    color: Colors.black87,
                                    // fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.trending_up,
                                  color: AppColors.askGreen,
                                  size: 20,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '+1.25%',
                                  style: AppText.smallN.copyWith(
                                    color: AppColors.askGreen,
                                    // fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // bottomNavigationBar: HomeNavigationBar(navigationShell: widget.navigationShell),
    );
  }
}

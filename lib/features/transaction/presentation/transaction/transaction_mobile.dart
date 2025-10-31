import 'package:app/shared/shared.dart';
import 'package:app/shared/utils/assets.gen.dart';
import 'package:app/shared/widgets/count_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hancod_theme/colors.dart';
import 'package:hancod_theme/forms.dart';
import 'package:hancod_theme/text.dart';

class TransactionScreenMobile extends ConsumerStatefulWidget {
  const TransactionScreenMobile({super.key});

  @override
  ConsumerState<TransactionScreenMobile> createState() =>
      _TransactionScreenMobileState();
}

class _TransactionScreenMobileState
    extends ConsumerState<TransactionScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Transaction',
          style: AppText.xLargeSB.copyWith(
            color: AppColors.white,
          ),
        ),
        centerTitle: false,
        leadingWidth: 10,
      ),
      body: Expanded(
          child: Column(
        children: [
          Container(
            // height: 100,
            // color: Colors.redAccent,
            child: Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: Row(
                    spacing:
                        10, // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CountCard(
                          statusColor: const Color(0xFF3B82F6),
                          count: '12',
                          status: 'Total'),
                      CountCard(
                          statusColor: const Color(0xFF22C55E),
                          count: '8',
                          status: 'Approved'),
                      CountCard(
                          statusColor: const Color(0xFFEF4444),
                          count: '9',
                          status: 'Total'),
                      CountCard(
                          statusColor: const Color(0xFFEAB308),
                          count: '4',
                          status: 'Total'),
                    ])),
          ),
          // Expanded(
          //   flex: 2,
          //   child: Container(color: Colors.pinkAccent,),),
          Container(
            //  color: Colors.yellowAccent,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // 🧱 Flexible text field inside FormBuilder
                Expanded(
                    child: FormBuilder(
                  child: AppTextForm<String>(
                    name: 'Search',
                    hintText: 'Search',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Assets.icons.search.svg(),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: AppColors.white,
                          width: 0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: AppColors.white,
                          width: 0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: AppColors.white,
                          width: 0,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: AppColors.title,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )),
                const SizedBox(width: 8), // spacing between field and button

                // ⚙️ Square ElevatedButton
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(45, 45), // ensures it's square
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    backgroundColor:
                        AppColors.white, // customize color if you like
                  ),
                  child: Assets.icons.filter.svg(),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 8,
            child: Container(
              // color: Colors.redAccent,
            ),
          ),
        ],
      )),
    );
  }
}

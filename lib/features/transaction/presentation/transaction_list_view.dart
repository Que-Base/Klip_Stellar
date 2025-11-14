import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klip/shared/style/text_style.dart';
import 'package:klip/shared/widget/liquid_glass_texture.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions", style: AppTextStyle.b16),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            Row(
              children: [
                LiquidGlassButton(
                  width: 20.w,
                  height: 20.h,
                  onTap: () {},
                  child: Text("All", style: AppTextStyle.sb16),
                ),
              ],
            ),
            SingleChildScrollView(child: Column(children: [])),
          ],
        ),
      ),
    );
  }
}

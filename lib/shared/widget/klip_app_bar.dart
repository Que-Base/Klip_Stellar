
import 'package:flutter/material.dart';
import 'package:klip/gen/assets.gen.dart';

PreferredSizeWidget klipsAppBar() {
  return AppBar(
    centerTitle: false,
    leading: CircleAvatar(),
    title: Text(
      "Welcome Adewale",
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
    actions: [
      Assets.svgIcons.walletScanIcon.svg(), // ~ Embed in a button
      const SizedBox(width: 10),
      Assets.svgIcons.dropDownIcon.svg(), // ~ Embed in a button
    ],
  );
}

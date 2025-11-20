import 'package:flutter/material.dart';
import 'package:klip/gen/assets.gen.dart';

enum AppBarStyle { type_1, type_2 }

PreferredSizeWidget klipsAppBar({
  AppBarStyle appBarStyle = AppBarStyle.type_1,
  String typeLabel = "",
}) {
  return AppBar(
    centerTitle: false,
    leading: switch (appBarStyle) {
      AppBarStyle.type_1 => CircleAvatar(),
      _ => null,
    },
    title: switch (appBarStyle) {
      AppBarStyle.type_1 => Text(
        "Welcome Adewale",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      _ => Text(
        typeLabel,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    },
    actions: [
      Assets.svgIcons.walletScanIcon.svg(), // ~ Embed in a button
      const SizedBox(width: 10),
      Assets.svgIcons.dropDownIcon.svg(), // ~ Embed in a button
      const SizedBox(width: 18),
    ],
  );
}

import 'package:flutter/foundation.dart' show immutable, VoidCallback;
import 'package:klip/shared/components/rich_text/base_text.dart';

@immutable
class LinkText extends BaseText {
  final VoidCallback onTapped;
  const LinkText({
    required super.text,
    required super.style,
    required this.onTapped,
  });
}

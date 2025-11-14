import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

// final navigationProvider = StateProvider<int>((ref) => 0);

@riverpod
class Navigation extends _$Navigation {
  @override
  int build() => 0;

  void navigate(int index) {
    state = index;
  }
}

// Provider for managing home route state (shell routing)
@riverpod
class HomeRoute extends _$HomeRoute {
  @override
  String build() => 'home';
}

// final homeRouteProvider = StateProvider<String>((ref) => 'home');

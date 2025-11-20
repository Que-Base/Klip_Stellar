// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_root_view_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OnboardingRootView)
const onboardingRootViewProvider = OnboardingRootViewProvider._();

final class OnboardingRootViewProvider
    extends $NotifierProvider<OnboardingRootView, OnboardingRootViewPage> {
  const OnboardingRootViewProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingRootViewProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingRootViewHash();

  @$internal
  @override
  OnboardingRootView create() => OnboardingRootView();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingRootViewPage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingRootViewPage>(value),
    );
  }
}

String _$onboardingRootViewHash() =>
    r'3be218f64b360275998c4a70a061a59a46578423';

abstract class _$OnboardingRootView extends $Notifier<OnboardingRootViewPage> {
  OnboardingRootViewPage build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<OnboardingRootViewPage, OnboardingRootViewPage>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OnboardingRootViewPage, OnboardingRootViewPage>,
              OnboardingRootViewPage,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

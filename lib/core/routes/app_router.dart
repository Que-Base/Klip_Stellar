import 'package:go_router/go_router.dart';
import 'package:klip/core/navigation/app_navigation.dart';
import 'package:klip/features/home/presentation/home_view.dart';
import 'package:klip/features/onboarding/presentation/onboarding_page_1.dart';
import 'package:klip/features/onboarding/presentation/onboarding_page_2.dart';
import 'package:klip/features/onboarding/presentation/onboarding_root_view.dart';
import 'package:klip/features/profile/auth/presentation/login_view.dart';
import 'package:klip/features/profile/auth/presentation/signup_view.dart';
import 'package:klip/features/saving/presentation/savings_view.dart';
import 'package:klip/features/settings/presentation/settings_view.dart';
import 'package:klip/features/transaction/presentation/transaction_list_view.dart';
import 'package:klip/features/transaction/presentation/transfer/success_transaction_view.dart';
import 'package:klip/features/transaction/presentation/transfer/wallet_selection_view.dart';
import 'package:klip/shared/widget/empty_view.dart';

class AppRoutes {
  static const String onboardingRoot = "/onboarding";
  static const String onboardingPage_1 = "page_1";
  static const String onboardingPage_2 = "page_2";

  static const String onboardingLogin = "login";
  static const String onboardingSignUp = "sign_up";

  static const String mainApp = "/main";
  static const String emptyView = "/empty_view";

  static const String homeRoute = "/main/home";

  static const String transaction = "/main/transaction";

  static const String savings = "/main/savings";

  static const String settings = "/main/settings";

  static const String transactionSuccessful = "/transaction/success";
  static const String transactionWalletSelection =
      "/transaction/wallet_selection";
}

class AppRouter {
  static final router = GoRouter(
    // initialLocation: AppRoutes.homeRoute,
    initialLocation: AppRoutes.onboardingRoot,

    routes: [
      GoRoute(
        path: AppRoutes.onboardingRoot,
        builder: (ctx, state) => const OnboardingRootPage(),
        routes: [
          GoRoute(
            path: AppRoutes.onboardingPage_1,
            name: AppRoutes.onboardingPage_1,
            builder: (context, state) => const OnboardingPage1(),
          ),
          GoRoute(
            path: AppRoutes.onboardingPage_2,
            name: AppRoutes.onboardingPage_2,
            builder: (context, state) => const OnboardingPage2(),
          ),

          // ~ Login
          GoRoute(
            path: AppRoutes.onboardingLogin,
            name: AppRoutes.onboardingLogin,
            builder: (context, state) => const LoginView(),
          ),

          // ~ SignUp
          GoRoute(
            path: AppRoutes.onboardingSignUp,
            name: AppRoutes.onboardingSignUp,
            builder: (context, state) => const SignupView(),
          ),
        ],
      ),

      GoRoute(
        path: AppRoutes.emptyView,
        builder: (context, state) => EmptyView(),
      ),

      ShellRoute(
        builder: (context, state, child) => NavigationMenu(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.homeRoute,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeView()),
          ),
          GoRoute(
            path: AppRoutes.savings,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SavingsView()),
          ),
          GoRoute(
            path: AppRoutes.transaction,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: TransactionListView()),
          ),
          GoRoute(
            path: AppRoutes.settings,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SettingsView()),
          ),
        ],
      ),

      // ~ Transaction Views
      GoRoute(
        path: AppRoutes.transactionWalletSelection,
        builder: (context, state) => WalletSelectionView(),
      ),
      GoRoute(
        path: AppRoutes.transactionSuccessful,
        builder: (context, state) => SuccessTransactionView(),
      ),
    ],
  );
}

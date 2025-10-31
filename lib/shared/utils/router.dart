import 'package:app/features/auth/presentation/auth_presentation.dart';
import 'package:app/features/deposit_withdraw_cash/deposit_withdraw_cash.dart';
import 'package:app/features/home/presentation/home/home.dart';

import 'package:app/features/branch/presentation/branch/branch.dart';
import 'package:app/features/home/home.dart';
import 'package:app/features/more/presentation/account_settings/account_settings.dart';
import 'package:app/features/more/presentation/change_password/change_password.dart';
import 'package:app/features/more/presentation/delete_account/delete_account.dart';
import 'package:app/features/more/presentation/help_and_support/help_and_support.dart';
import 'package:app/features/more/presentation/more/more.dart';
import 'package:app/features/more/presentation/notification_preferences/notification_preferences.dart';
import 'package:app/features/swap/swap.dart';
import 'package:app/features/transaction/presentation/transaction/transaction.dart';

import 'package:app/features/deposit_withdraw_cash/deposit_withdraw_cash.dart';

import 'package:app/shared/shared.dart';
import 'package:app/shared/widgets/navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Exposes a [GoRouter] that uses a [Listenable] to refresh its internal state.
///
/// With Riverpod, we can't register a dependency via an Inherited Widget,
/// thus making this implementation the "leanest" possible
///
/// To sync our app state with this our router, we simply update our listenable
/// via `ref.listen`,
/// and pass it to GoRouter's `refreshListenable`.
/// In this example, this will trigger redirects on any authentication change.
///
/// Obviously, more logic could be implemented here, but again, this is meant
/// to be a simple example.
/// You can always build more listenables and even merge more than one
/// into a more complex `ChangeNotifier`,
/// but that's up to your case and out of this scope.

class AppRouter {
  AppRouter(this.ref) {
    // ref
    //   ..onDispose(
    //     () {
    //       authState.dispose();
    //       router.dispose();
    //     },
    //   );
    // ..listen(
    //   authStateProvider.select(
    //     (value) => value.asData,
    //   ),
    //   (_, next) {
    //     authState.value = next;
    //   },
    // );
  }
  // final authState = ValueNotifier<AsyncValue<AuthState>?>(const AsyncLoading());

  final Ref ref;

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _shellKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  static GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;
  static GlobalKey<NavigatorState> get shellKey => _shellKey;

  static BuildContext get rootContext => _rootNavigatorKey.currentContext!;
  static BuildContext get shellContext => _shellKey.currentContext!;

  static AppLocalizations get l10n => rootContext.l10n;

  static const String home = 'home';
  static const String splash = 'splash';

  //Auth Section
  static const String login = 'login';

  static const String password = 'password';
  static const String profilePicture = 'profile_picture';
  static const String registrationSuccess = 'registration_success';

  static const String wallet = 'wallet';
  static const String transaction = 'transaction';
  static const String swap = 'swap';
  static const String branch = 'branch';

  static const String more = 'more';

  static const String accountSettings = 'account_settings';
  static const String changePassword = 'change_password';
  static const String deleteAccount = 'delete_account';

  static const String helpAndSupport = 'help_and_support';
  static const String aboutUs = 'about_us';
  static const String notificationPreferences = 'notification_preferences';

  late final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/$login',
    routes: [
      // GoRoute(
      //   path: '/',
      //   name: login,
      //   builder: (context, state) => const HomeScreen(),
      // ),
      GoRoute(
        path: '/$login',
        name: login,
        builder: (context, state) => const RegistrationScreen(),
        routes: [
          GoRoute(
            path: password,
            name: password,
            builder: (context, state) => const PasswordScreen(),
          ),
          GoRoute(
            path: profilePicture,
            name: profilePicture,
            builder: (context, state) => const ProfilePictureScreen(),
          ),
          GoRoute(
            path: registrationSuccess,
            name: registrationSuccess,
            builder: (context, state) {
              return RegistrationSuccessScreen(
                title: state.uri.queryParameters['title'] ?? '',
                subtitle: state.uri.queryParameters['subtitle'] ?? '',
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/',
        name: home,

        // Add a redirect to the first screen of your shell
        redirect: (context, state) {
          // If the user navigates to exactly '/home', send them to the dashboard
          if (state.fullPath == '/') {
            return '/$wallet';
          }
          // Otherwise, let them continue to their intended sub-route
          return null;
        },
        // IMPORTANT: No builder here. This route's only job is to host child routes.
        routes: [
          // Nest the StatefulShellRoute inside
          StatefulShellRoute.indexedStack(
            builder: (
              BuildContext context,
              GoRouterState state,
              StatefulNavigationShell navigationShell,
            ) =>
                HomeNavigationBar(navigationShell: navigationShell),
            branches: <StatefulShellBranch>[
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: wallet,
                    name: wallet,
                    builder: (context, state) => const HomeScreen(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    // Path is now relative to '/home'
                    path: transaction,
                    name: transaction,
                    builder: (context, state) => const TransactionScreen(),
                  ),
                ],
              ),
              // StatefulShellBranch(
              //   routes: <RouteBase>[
              //     GoRoute(
              //       path: swap,
              //       name: swap,
              //       builder: (context, state) => SwapScreen(),
              //       routes: [
              //         // GoRoute(
              //         //   path: '$ledgerEntriesDetails/:ledgerId',
              //         //   name: ledgerEntriesDetails,
              //         //   parentNavigatorKey: _rootNavigatorKey,
              //         //   builder: (context, state) {
              //         //     final ledgerId =
              //         //         state.pathParameters['ledgerId'] ?? '';
              //         //     return LedgerEntryDetailsScreen(ledgerId: ledgerId);
              //         //   },
              //         // ),
              //       ],
              //     ),
              //   ],
              // ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: branch,
                    name: branch,
                    builder: (context, state) => const BranchScreen(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: more,
                    name: more,
                    builder: (context, state) => const MoreScreen(),
                    routes: [
                      GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        path: accountSettings,
                        name: accountSettings,
                        builder: (context, state) =>
                            const AccountSettingsScreen(),
                        routes: [
                          GoRoute(
                            parentNavigatorKey: _rootNavigatorKey,
                            path: changePassword,
                            name: changePassword,
                            builder: (context, state) =>
                                const ChangePasswordScreen(),
                          ),
                          GoRoute(
                            parentNavigatorKey: _rootNavigatorKey,
                            path: deleteAccount,
                            name: deleteAccount,
                            builder: (context, state) =>
                                const DeleteAccountScreen(),
                          ),
                        ],
                      ),
                      GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        path: notificationPreferences,
                        name: notificationPreferences,
                        builder: (context, state) =>
                            const NotificationPreferencesScreen(),
                      ),
                      GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        path: helpAndSupport,
                        name: helpAndSupport,
                        builder: (context, state) =>
                            const HelpAndSupportScreen(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    // refreshListenable: Listenable.merge([authState]),
    redirect: (context, state) {
      return null;
      // return '/$login';

      /// Auth reirection flow
      /*   if (authState.value == null) {
        return null;
      }
      if (authState.value!.unwrapPrevious().hasError) {
        // Return Login Route
        return AppRouter.login;
      }
      if (authState.value!.isLoading || !authState.value!.hasValue) {
        // Return Splash Route
        return AppRouter.splash;
      }

      final isAuth = !(authState.value!.value?.session?.isExpired ?? true);

      final isSplash = state.uri.path == AppRouter.splash;
      if (isSplash) {
        return isAuth ? AppRouter.home : AppRouter.login;
      }

      final isLoggingIn = state.uri.path == AppRouter.login;
      if (isLoggingIn) return isAuth ? AppRouter.home : null;

      return isAuth ? null : AppRouter.splash; */
    },
  );

  CustomTransitionPage<void> fadeTransition(
    GoRouterState state,
    Widget screen,
  ) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: screen,
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) =>
          FadeTransition(
        opacity: animation.drive(
          Tween<double>(
            begin: 0,
            end: 1,
          ).chain(CurveTween(curve: Curves.easeIn)),
        ),
        child: child,
      ),
    );
  }

  CustomTransitionPage<void> slideTransition(
    GoRouterState state,
    Widget screen,
  ) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: screen,
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) =>
          SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeIn)),
        ),
        child: child,
      ),
    );
  }

  static void goNamed(
    String route, {
    Object? extra,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) =>
      _rootNavigatorKey.currentState?.context.goNamed(
        route,
        extra: extra,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
      );

  static void go(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) =>
      _rootNavigatorKey.currentState?.context.go(
        name,
        extra: extra,
      );

  /// Navigate to a named route onto the page stack.
  static Future<T?>? pushNamed<T extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) =>
      _rootNavigatorKey.currentState?.context.pushNamed<T>(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );

  static void pop<T extends Object?>([T? result]) =>
      _rootNavigatorKey.currentContext?.pop(result);

  static T read<T>(ProviderBase<T> provider) {
    return ProviderScope.containerOf(rootContext, listen: false).read(provider);
  }

  static T watch<T>(ProviderBase<T> provider) {
    return ProviderScope.containerOf(rootContext).read(provider);
  }
}

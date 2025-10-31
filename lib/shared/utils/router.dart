
import 'package:app/features/branch/presentation/branch/branch.dart';
import 'package:app/features/home/home.dart';
import 'package:app/features/more/presentation/more/more.dart';
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
  static const String login = 'login';
  static const String wallet = 'wallet'; 
  static const String transaction = 'transaction';
  static const String swap = 'swap';
  static const String branch = 'branch';
  static const String more = 'more';

  late final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      // GoRoute(
      //   path: '/',
      //   name: login, 
      //   builder: (context, state) => const HomeScreen(),
      // ),
      
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
                    routes: [
                      
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    // Path is now relative to '/home'
                    path: transaction,
                    name: transaction,
                    builder: (context, state) => TransactionScreen(),
                  ),
                ],
              ),
              
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: branch,
                    name: branch,
                    builder: (context, state) => const BranchScreen(),
                    routes: [
                 
                    ],
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
                 
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],

      ),

      GoRoute(
  path: '/$swap',
  name: swap,
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const SwapScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // 👇 Slide from bottom to top
        final tween = Tween<Offset>(
          begin: const Offset(0, 1), // start below the screen
          end: Offset.zero, // move to its normal position
        ).chain(CurveTween(curve: Curves.easeInOut));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  },
), 

    ],
    // refreshListenable: Listenable.merge([authState]),
    redirect: (context, state) {
      return null;

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

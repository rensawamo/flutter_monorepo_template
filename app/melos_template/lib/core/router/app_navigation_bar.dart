import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: navigationShell,
          // bottomNavigationBar: Stack(
          //   children: [
          //     NavigationBar(
          //       selectedIndex: navigationShell.currentIndex,
          //       destinations: [
          //         NavigationDestination(
          //           icon: const Icon(
          //             Icons.home,
          //           ),
          //           label: context.l10n.home,
          //         ),
          //         NavigationDestination(
          //           icon: const Icon(
          //             Icons.settings,
          //           ),
          //           label: context.l10n.setting,
          //         ),
          //       ],
          //       onDestinationSelected: (index) {
          //         navigationShell.goBranch(
          //           index,
          //           initialLocation: index == navigationShell.currentIndex,
          //         );
          //       },
          //       indicatorColor:
          //           Theme.of(context).colorScheme.primary.withOpacity(0.3),
          //       labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          //     ),
          //     // Divider
          //     const Positioned(
          //       top: 0,
          //       left: 0,
          //       right: 0,
          //       child: Divider(
          //         color: Colors.grey,
          //         thickness: 0.3,
          //         height: 1,
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ],
    );
  }
}
